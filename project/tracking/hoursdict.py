# -*- coding: utf-8 -*-
from collections import OrderedDict
import datetime
from dateutil.parser import parse
from dateutil.rrule import rrule, MONTHLY, WEEKLY
from django.conf import settings
from isoweek import Week
import itertools
from django.db import connections
from django.db.models import Sum, Min, Max
from models import Worker, Activity, WeeklyActivity, RecurringActivity


class HoursDict(OrderedDict):
    key_date_format = '%Y-%m-%d'

    def __init__(self, *args, **kwargs):
        """
        Build and return a HoursDict instance, containing all activities,
        already computed by months.
        """
        breakdown_type = kwargs.pop('breakdown_type', 'M')

        year = kwargs.pop('year', None)

        super(HoursDict, self).__init__(*args, **kwargs)

        workers = Worker.objects.order_by('user__username').select_related('user').prefetch_related('worker_projects')
        for worker in workers:
            worker_username = worker.user.username

            if worker_username == 'admin':
                continue

            self[worker_username] = OrderedDict()
            for project in sorted(worker.worker_projects.all(), key=lambda x: x.identification_code):
                project_code = project.identification_code

                # generate empty dict with weekdays that will be filled with data
                self[worker_username][project_code] = self.generate_base_dict(breakdown_type, year)

                #
                # computing hours breakdowns (based on breakdown_type: monthly|weekly)
                #

                activities = Activity.objects.filter(worker=worker, project=project).order_by('activity_date')
                weekly_activities = WeeklyActivity.objects.filter(worker=worker, project=project).order_by('week')
                recurring_activities = RecurringActivity.objects.filter(worker=worker, project=project).order_by('start_date')

                if year:
                    activities = activities.filter(activity_date__year=year)
                    weekly_activities = weekly_activities.filter(week__startswith=str(year))
                    recurring_activities = recurring_activities.filter(start_date__year=year)

                self.add_simple_activities(activities, worker_username, project_code, breakdown_type)
                self.add_weekly_activities(weekly_activities, worker_username, project_code, breakdown_type)
                self.add_recurring_activities(recurring_activities, worker_username, project_code, breakdown_type)

                # re-sort ordered dict, on month key (improve readability)
                sd = OrderedDict(sorted(self[worker_username][project_code].items(), key=lambda t: t[0]))
                self[worker_username][project_code] = sd

    def generate_base_dict(self, breakdown_type, year):
        """
        Generates base dictionary for hours, adding every needed date to the dict with 0 hours
        so the final dict doesn't have blank columns

        :param breakdown_type: M or W
        :param year: None or year value
        :return: sd
        """
        sd = OrderedDict()

        end_date = Week.withdate(datetime.date.today()).monday()
        if year:
            # starts from 1 Jan if breakdown on months, else on the monday of the week of the 1st Jan
            if breakdown_type == 'W':
                start_date = Week.withdate(datetime.datetime.strptime('{}-01-01'.format(year), self.key_date_format)).monday()
            else:
                start_date = datetime.datetime.strptime('{}-01-01'.format(year), self.key_date_format).date()
        else:
            # else: first week is oldest week in the db for activity
            start_date = Week.withdate(Activity.objects.order_by('activity_date').first().activity_date).monday()

        dates = itertools.islice(self.date_generator(breakdown_type, start_date, end_date), 0, None)

        for date in dates:
            sd[date.strftime(self.key_date_format)] = 0

        return sd

    @staticmethod
    def date_generator(breakdown_type, start_date, end_date):
        from_date = start_date
        while from_date <= end_date:
            yield from_date
            if breakdown_type == 'W':
                from_date = from_date + datetime.timedelta(days=7)
            else:
                def add_one_month(dt0):
                    dt1 = dt0.replace(day=1)
                    dt2 = dt1 + datetime.timedelta(days=32)
                    dt3 = dt2.replace(day=1)
                    return dt3

                from_date = add_one_month(from_date)

    def add_simple_activities(self, activities, worker_username, project_code, breakdown_type='M'):
        """
        Add simple activities breakdown to self
        :param activities:      Activity array
        :param worker_username: Worker ID (username)
        :param project_code:    Project ID
        :param breakdown_type:  M or W
        :return: None
        """
        conns = connections[Activity.objects.db]

        if breakdown_type == 'W':
            # computes daily breakdowns for worked hours
            activity_hours = activities.extra(
                {'day': conns.ops.date_trunc_sql('day', 'activity_date')}
            ).values('day').annotate(hsum=Sum('hours'))

            # rearrange in weekly breakdowns,
            # limited to last PAST_WEEKS_IN_REPORTS

            current_week = Week.thisweek()
            for ah in activity_hours:
                day = ah['day']
                week = Week.withdate(day)
                week_monday_date = week.monday().strftime(self.key_date_format)
                if current_week - week <= settings.PAST_WEEKS_IN_REPORTS:
                    # creates column in the csv if not present
                    if week_monday_date not in self[worker_username][project_code]:
                        self[worker_username][project_code][week_monday_date] = 0

                    # sums up activity hours
                    self[worker_username][project_code][week_monday_date] += ah['hsum']
        else:
            # computes monthly breakdowns for worked hours
            activity_hours = activities.extra(
                {'month': conns.ops.date_trunc_sql('month', 'activity_date')}
            ).values('month').annotate(hsum=Sum('hours'))

            for ah in activity_hours:
                ah_month = ah['month'].strftime(self.key_date_format)
                if ah_month not in self[worker_username][project_code]:
                    self[worker_username][project_code][ah_month] = 0
                self[worker_username][project_code][ah_month] += ah['hsum']

    def add_weekly_activities(self, activities, wid, pid, breakdown_type='M'):
        """
        Add weekly activities breakdown to self
        :param activities:     Activity array
        :param wid:            Worker ID (username)
        :param pid:            Project ID
        :param breakdown_type: M or W
        :return: None
        """
        for aw in activities:
            if breakdown_type == 'W':
                # add hours to weekly breakdowns
                # limited to last PAST_WEEKS_IN_REPORTS
                w = Week.fromstring(aw.week)
                if Week.thisweek() - w <= settings.PAST_WEEKS_IN_REPORTS:
                    week = w.monday().strftime(self.key_date_format)
                    if week not in self[wid][pid]:
                        self[wid][pid][week] = 0
                    self[wid][pid][week] += aw.hours
            else:
                # I choose to assign wednesday's month
                # as the week's month (ad arbitrium)
                # when rearranging into monthly breakdowns
                month = Week.fromstring(aw.week).wednesday().strftime('%Y-%m-01')
                if month not in self[wid][pid]:
                    self[wid][pid][month] = 0
                self[wid][pid][month] += aw.hours

    def add_recurring_activities(self, a, wid, pid, breakdown_type='M'):
        """
        Add recurring activities breakdown to self
        :param a:              Activity array
        :param wid:            Worker ID (username)
        :param pid:            Project ID
        :param breakdown_type: M or W
        :return: None
        """
        if a.count():
            # extract dates range (from-to), as datetime
            # extraction is limited to current datetime
            a_dates_limits = a.aggregate(from_date=Min('start_date'), to_date=Max('end_date'))
            from_date = parse(a_dates_limits['from_date'].strftime(self.key_date_format))
            to_date = parse(a_dates_limits['to_date'].strftime(self.key_date_format))
            if to_date > datetime.datetime.now():
                to_date = datetime.datetime.now()

            if breakdown_type == 'W':
                # get the latest N weeks
                w_to = Week.thisweek()
                w_from = w_to - settings.PAST_WEEKS_IN_REPORTS

                from_date = datetime.datetime(*w_from.monday().timetuple()[:-4])
                to_date = datetime.datetime(*w_to.monday().timetuple()[:-4])

                # generate all steps, weeks by weeks, with pre- and after- intervals
                d_weeks = list(
                    rrule(
                        WEEKLY, dtstart=from_date
                    ).between(from_date, to_date, inc=True)
                )

                # for each week interval, the hours
                # worked on all activities are summed
                for i, d_week in enumerate(d_weeks[:-1]):
                    week = d_week.strftime(self.key_date_format)
                    for ar in a:
                        a_start_date = datetime.datetime(*ar.start_date.timetuple()[:-4])
                        a_end_date = datetime.datetime(*ar.end_date.timetuple()[:-4])
                        if a_start_date <= d_weeks[i + 1] and a_end_date >= d_week:
                            n_recurrences = len(
                                ar.recurrences.to_dateutil_rruleset(
                                    dtstart=max(d_week, a_start_date),
                                    dtend=min(d_weeks[i + 1], a_end_date)
                                ).between(
                                    max(d_week, a_start_date),
                                    min(d_weeks[i + 1], a_end_date),
                                    inc=False
                                )
                            )
                            if week not in self[wid][pid]:
                                self[wid][pid][week] = 0
                            self[wid][pid][week] += ar.hours * n_recurrences

            else:
                # generate all steps, month by month, with pre- and after- intervals
                d_months = list(
                    rrule(
                        MONTHLY, dtstart=parse(from_date.strftime('%Y-%m-01'))
                    ).between(from_date, to_date)
                )

                if not d_months:
                    d_months.append(from_date)
                    d_months.append(to_date)
                else:
                    if from_date < d_months[0]:
                        d_months.insert(0, from_date)
                    if to_date > d_months[-1]:
                        d_months.append(to_date)

                # for each month interval, the hours
                # worked on all activities are summed
                for i, d_month in enumerate(d_months[:-1]):
                    month = d_month.strftime('%Y-%m-01')
                    for ar in a:
                        a_start_date = datetime.datetime(*ar.start_date.timetuple()[:-4])
                        a_end_date = datetime.datetime(*ar.end_date.timetuple()[:-4])
                        if a_start_date <= d_months[i + 1] and a_end_date >= d_month:
                            n_recurrences = len(
                                ar.recurrences.to_dateutil_rruleset(
                                    dtstart=max(d_month, a_start_date),
                                    dtend=min(d_months[i + 1], a_end_date)
                                ).between(
                                    max(d_month, a_start_date),
                                    min(d_months[i + 1], a_end_date),
                                    inc=False
                                )
                            )
                            if month not in self[wid][pid]:
                                self[wid][pid][month] = 0
                            self[wid][pid][month] += ar.hours * n_recurrences
