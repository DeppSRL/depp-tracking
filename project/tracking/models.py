# coding=utf-8
from collections import OrderedDict
import datetime
from dateutil.parser import parse
from dateutil.rrule import rrule, MONTHLY, WEEKLY
from django.conf import settings
from django.contrib.auth.models import User, Group
from django.db import models, connections
from django.db.models import Sum, Min, Max
from django.utils.translation import ugettext_lazy as _
from isoweek import Week
from model_utils import Choices
import recurrence.fields
from .behaviors import Dateframeable

__author__ = 'guglielmo'

class Worker(models.Model):
    TYPES = Choices(
        (0, 'associate', _('Associate')),
        (1, 'collaborator', _('Collaborator or employee')),
        (2, 'external', _('External resource')),
    )

    CONTRACTS = Choices(
        (0, 'indeterminato', _('Fully employee')),
        (1, 'collaboratore', _('Collaboration to a project')),
        (1, 'partitaiva', _('External consultancy')),
    )

    user = models.OneToOneField(User)
    worker_type = models.IntegerField(_('worker type'), choices=TYPES, blank=True, null=True, help_text=_("The type of worker"))
    contract_type = models.IntegerField(_('contract type'), choices=CONTRACTS, blank=True, null=True, help_text=_("The type of contract between the worker and the company"))
    time_perc = models.IntegerField(_('time percentage'), blank=True, null=True, help_text=_("Time percentage (100% = full time)"))

    def is_manager(self):
        g = Group.objects.get(name__iexact='manager')
        return g in self.user.groups.all()

    def is_project_manager(self):
        g = Group.objects.get(name__iexact='project manager')
        return g in self.user.groups.all()

    def is_superuser(self):
        return self.user.is_superuser



    def __unicode__(self):
        return self.user.username

    class Meta:
        verbose_name = _("Worker")
        verbose_name_plural = _("Workers")


class Project(Dateframeable, models.Model):
    PHASES = Choices(
        (0, 'draft', _('Draft')),
        (1, 'analysis', _('Analysis')),
        (2, 'design', _('Design')),
        (3, 'implementation', _('Implementation')),
        (4, 'maintenance', _('Maintenance')),
        (9, 'complete', _('Complete')),
    )
    TYPES = Choices(
        (0, 'ongoing', _('Ongoing activity')),
        (1, 'dateframed', _('Date framed activity')),
    )
    STATUS = Choices(
        (0, 'closed', _('Closed')),
        (1, 'active', _('Active')),
    )

    name = models.CharField(_("name"), max_length=128, help_text=_("A project's name"))
    identification_code = models.CharField(_("identification code"), max_length=5, help_text=_("An alphanumeric identification code, max 5 chars"))
    description = models.TextField(_("description"), help_text=_("An extensive description of the project"))
    resources = models.TextField(_("resources"), help_text=_("A non-structured list of linked resources: github, staging, IP, ..."))
    customer = models.CharField(_("customer"), max_length=128, help_text=_("The identifier of the customer"))
    managers = models.ManyToManyField(Worker, related_name='manager_projects', help_text=_("The manager(s) of this project"))
    workers = models.ManyToManyField(Worker, related_name='worker_projects', help_text=_("The worker(s) of this project"))
    project_type = models.IntegerField(_('project type'), choices=TYPES, help_text=_("Whether the project is an ongoing activity or it has a start and an end date"))
    phase = models.IntegerField(_('phase'), choices=PHASES, null=True, blank=True, help_text=_("The status of advancement of the project"))
    status = models.IntegerField(_('status'), choices=STATUS, null=True, blank=True, help_text=_("Whether the project is active or closed"))

    def __unicode__(self):
        return u"{0} ({1})".format(self.name, self.identification_code)

    class Meta:
        verbose_name = _("Project")
        verbose_name_plural = _("Projects")


class BaseActivity(models.Model):
    TYPES = Choices(
        (0, 'meeting', _('Meeting the client')),
        (1, 'analysis', _('Analysis')),
        (2, 'design', _('Design')),
        (3, 'development', _('Development or debugging')),
        (4, 'data', _('Data management')),
        (5, 'content', _('Content management')),
        (6, 'management', _('Project management')),
        (7, 'graphic', _('Graphic design')),
        (8, 'marketing', _('Marketing and commercial activities')),
        (9, 'internal meeting', _('Internal meeting')),
        (10, 'other', _('Other')),
    )

    project = models.ForeignKey(Project, verbose_name=_("project"))
    activity_type = models.IntegerField(_("activity type"), choices=TYPES, null=True, blank=True, help_text=_("Select the type of activity. Don't be picky."))
    description = models.CharField(_("description"), max_length=256, help_text=_("A very brief description of the activity (max 256 chars)."))
    hours = models.DecimalField(_('hours worked'), max_digits=3, decimal_places=1, help_text=_("Number of hours worked, can be a decimal"))

    def __unicode__(self):
        return u"{0}".format(self.description)

    class Meta:
        abstract = True

class Activity(BaseActivity):
    worker = models.ForeignKey(Worker, verbose_name=_("worker"),  related_name='assigned_activities')
    owner = models.ForeignKey(Worker, verbose_name=_("owner"), related_name='own_activities')
    activity_date = models.DateField(_("activity date"), help_text=_("Pick up the exact date of the activity."))

    def __unicode__(self):
        return u"{0} ({1}h)".format(self.description, self.hours)

    class Meta:
        verbose_name = _("Activity")
        verbose_name_plural = _("Activities")

class WeeklyActivity(BaseActivity):
    worker = models.ForeignKey(Worker, verbose_name=_("worker"), related_name='assigned_weekly_activities')
    owner = models.ForeignKey(Worker, verbose_name=_("owner"), related_name='own_weekly_activities')
    week = models.CharField(_("week"), max_length=7, help_text=_("The week"))

    def __unicode__(self):
        return u"{0} ({1}h)".format(self.description, self.hours)

    class Meta:
        verbose_name = _("Weekly activity")
        verbose_name_plural = _("Weekly activities")

class RecurringActivity(BaseActivity):
    worker = models.ForeignKey(Worker, verbose_name=_("worker"), related_name='assigned_recurring_activities')
    owner = models.ForeignKey(Worker, verbose_name=_("owner"), related_name='own_recurring_activities')
    start_date = models.DateField(_("start date"), help_text=_("When the activity started."))
    end_date = models.DateField(_("end_date"), help_text=_("When the activity will end."))
    recurrences = recurrence.fields.RecurrenceField(_("recurrences"), blank=True, null=True)

    class Meta:
        verbose_name = _("Recurring activity")
        verbose_name_plural = _("Recurring activities")


class HoursDict(OrderedDict):

    def __init__(self, *args, **kwargs):
        """
        Build and return a HoursDict instance, containing all activities,
        already computed by months.
        """

        exclude_admin = False
        if 'exclude_admin' in kwargs:
            exclude_admin = bool(kwargs.pop('exclude_admin'))

        breakdown_type = 'M'
        if 'breakdown_type' in kwargs:
            breakdown_type = kwargs.pop('breakdown_type')

        super(HoursDict, self).__init__(*args, **kwargs)

        workers = Worker.objects.all()
        for w in workers:
            wid = w.user.username
            if exclude_admin and w.user.username == 'admin':
                continue

            self[wid] = OrderedDict()
            for p in w.worker_projects.all():

                pid = p.identification_code
                self[wid][pid] = OrderedDict()

                #
                # computing hours breakdowns (based on breakdown_type: monthly|weekly)
                #
                a = Activity.objects.filter(worker=w, project=p)
                self.add_simple_activities(a, wid, pid, breakdown_type)

                # weekly activities
                a = WeeklyActivity.objects.filter(
                    worker=w, project=p
                ).order_by('week')
                self.add_weekly_activities(a, wid, pid, breakdown_type)


                # recurring activities
                a = RecurringActivity.objects.filter(
                    worker=w, project=p
                ).order_by('start_date')
                self.add_recurring_activities(a, wid, pid, breakdown_type)

                # re-sort ordered dict, on month key (improve readability)
                sd = OrderedDict(sorted(self[wid][pid].items(), key=lambda t: t[0]))
                self[wid][pid] = sd

    def add_simple_activities(self, a, wid, pid, breakdown_type='M'):
        """
        Add simple activities breakdown to self
        :param a:              Activity array
        :param wid:            Worker ID (username)
        :param pid:            Project ID
        :param breakdown_type: M or W
        :return: None
        """
        conns = connections[Activity.objects.db]

        if breakdown_type == 'W':
            # computes daily breakdowns for worked hours
            a_hours = a.extra(
                {'day':conns.ops.date_trunc_sql('day', 'activity_date')}
            ).values('day').annotate(hsum=Sum('hours'))

            # rearrange in weekly breakdowns,
            # limited to last PAST_WEEKS_IN_REPORTS
            for ah in a_hours:
                d = datetime.datetime.strptime(ah['day'], "%Y-%m-%d")
                w = Week.withdate(d)
                w_iso = w.isoformat()
                week = w.monday().strftime("%Y-%m-%d")
                if Week.thisweek() - w <= settings.PAST_WEEKS_IN_REPORTS:
                    if week not in self[wid][pid]:
                        self[wid][pid][week] = 0
                    self[wid][pid][week] += ah['hsum']
        else:
            # computes monthly breakdowns for worked hours
            a_hours = a.extra(
                {'month':conns.ops.date_trunc_sql('month', 'activity_date')}
            ).values('month').annotate(hsum=Sum('hours'))
            for ah in a_hours:
                if ah['month'] not in self[wid][pid]:
                    self[wid][pid][ah['month']] = 0
                self[wid][pid][ah['month']] += ah['hsum']

    def add_weekly_activities(self, a, wid, pid, breakdown_type='M'):
        """
        Add weekly activities breakdown to self
        :param a:              Activity array
        :param wid:            Worker ID (username)
        :param pid:            Project ID
        :param breakdown_type: M or W
        :return: None
        """
        for aw in a:
            if breakdown_type == 'W':
                # add hours to weekly breakdowns
                # limited to last PAST_WEEKS_IN_REPORTS
                w = Week.fromstring(aw.week)
                if Week.thisweek() - w <= settings.PAST_WEEKS_IN_REPORTS:
                    week = w.monday().strftime("%Y-%m-%d")
                    if week not in self[wid][pid]:
                        self[wid][pid][week] = 0
                    self[wid][pid][week] += aw.hours
            else:
                # I choose to assign wednesday's month
                # as the week'smonth (ad arbitrium)
                # when rearranging into monthly breakdowns
                month = Week.fromstring(aw.week).wednesday().strftime("%Y-%m-01")
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
            from_date = parse(a_dates_limits['from_date'].strftime("%Y-%m-%d"))
            to_date = parse(a_dates_limits['to_date'].strftime("%Y-%m-%d"))
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
                    week = d_week.strftime("%Y-%m-%d")
                    for ar in a:
                        a_start_date = datetime.datetime(*ar.start_date.timetuple()[:-4])
                        a_end_date = datetime.datetime(*ar.end_date.timetuple()[:-4])
                        if a_start_date <= d_weeks[i+1] and a_end_date >= d_week:
                            n_recurrences = len(
                                ar.recurrences.to_dateutil_rruleset(
                                  dtstart=max(d_week, a_start_date),
                                  dtend=min(d_weeks[i+1], a_end_date)
                                ).between(
                                    max(d_week, a_start_date),
                                    min(d_weeks[i+1], a_end_date),
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
                        MONTHLY, dtstart=parse(from_date.strftime("%Y-%m-01"))
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
                    month = d_month.strftime("%Y-%m-01")
                    for ar in a:
                        a_start_date = datetime.datetime(*ar.start_date.timetuple()[:-4])
                        a_end_date = datetime.datetime(*ar.end_date.timetuple()[:-4])
                        if a_start_date <= d_months[i+1] and a_end_date >= d_month:
                            n_recurrences = len(
                                ar.recurrences.to_dateutil_rruleset(
                                  dtstart=max(d_month, a_start_date),
                                  dtend=min(d_months[i+1], a_end_date)
                                ).between(
                                    max(d_month, a_start_date),
                                    min(d_months[i+1], a_end_date),
                                    inc=False
                                )
                            )
                            if month not in self[wid][pid]:
                                self[wid][pid][month] = 0
                            self[wid][pid][month] += ar.hours * n_recurrences
