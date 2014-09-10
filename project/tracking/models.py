# coding=utf-8
from collections import OrderedDict
import datetime
import dateutil
from dateutil.parser import parse
from dateutil.relativedelta import relativedelta
from dateutil.rrule import rrule, MONTHLY
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
        super(HoursDict, self).__init__(*args, **kwargs)

        conns = connections[Activity.objects.db]
        workers = Worker.objects.all()

        for w in workers:
            wid = w.user.username
            self[wid] = OrderedDict()
            for p in w.worker_projects.all():
                pid = p.identification_code
                self[wid][pid] = OrderedDict()

                #
                # computing hours monthly breakdowns
                #

                # simple activities
                a = Activity.objects.filter(worker=w, project=p)
                a_hours = a.extra(
                    {'month':conns.ops.date_trunc_sql('month', 'activity_date')}
                ).values('month').annotate(hsum=Sum('hours'))
                for ah in a_hours:
                    self[wid][pid][ah['month']] = ah['hsum']


                # weekly activities
                a = WeeklyActivity.objects.filter(
                    worker=w, project=p
                ).order_by('week')
                for aw in a:
                    # I choose to assign wednesday's month as the week month (ad arbitrium)
                    month = Week.fromstring(aw.week).wednesday().strftime("%Y-%m-01")
                    if month not in self[wid][pid]:
                        self[wid][pid][month] = 0
                    self[wid][pid][month] += aw.hours


                # recurring activities
                a = RecurringActivity.objects.filter(
                    worker=w, project=p
                ).order_by('start_date')

                if a.count():

                    # extract dates range (from-to), as datetime
                    # extraction is limited to current datetime
                    a_dates_limits = a.aggregate(from_date=Min('start_date'), to_date=Max('end_date'))
                    from_date = parse(a_dates_limits['from_date'].strftime("%Y-%m-%d"))
                    to_date = parse(a_dates_limits['to_date'].strftime("%Y-%m-%d"))
                    if to_date > datetime.datetime.now():
                        to_date = datetime.datetime.now()

                    # generate all steps, month by month, with pre- and after- intervals
                    d_months = list(
                        rrule(
                            MONTHLY, dtstart=parse(from_date.strftime("%Y-%m-01"))
                        ).between(from_date, to_date)
                    )

                    if not d_months:
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
                            n_recurrences = len(
                                ar.recurrences.to_dateutil_rruleset(
                                  dtstart=d_month
                                ).between(
                                    d_month,
                                    d_months[i+1],
                                    inc=False
                                )
                            )
                            if month not in self[wid][pid]:
                                self[wid][pid][month] = 0
                            self[wid][pid][month] += ar.hours * n_recurrences

                # re-sort ordered dict, on month key (improve readability)
                sd = OrderedDict(sorted(self[wid][pid].items(), key=lambda t: t[0]))
                self[wid][pid] = sd