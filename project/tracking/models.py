# -*- coding: utf-8 -*-
import datetime
from django.contrib.auth.models import User, Group
from django.db import models
from django.db.models import Q
from django.utils.translation import ugettext_lazy as _
from model_utils import Choices
import recurrence.fields
from behaviors import Dateframeable


__author__ = 'guglielmo'


class WorkerQuerySet(models.query.QuerySet):
    def by_year(self, year):
        return self\
            .filter(Q(contracts__start_date__lte='{}-12-31'.format(year)))\
            .filter(Q(contracts__end_date__gte='{}-01-01'.format(year)) | Q(contracts__end_date__isnull=True))\
            .distinct()


class WorkerManager(models.Manager):
    def get_queryset(self):
        return WorkerQuerySet(self.model, using=self._db)

    def by_year(self, year):
        return self.get_queryset().by_year(year)


class Worker(models.Model):
    TYPES = Choices(
        (0, 'associate', _('Associate')),
        (1, 'collaborator', _('Collaborator or employee')),
        (2, 'external', _('External resource')),
    )

    user = models.OneToOneField(User)
    worker_type = models.IntegerField(_('worker type'), choices=TYPES, blank=True, null=True, help_text=_('The type of worker'))

    objects = WorkerManager()

    def is_manager(self):
        g = Group.objects.get(name__iexact='manager')
        return g in self.user.groups.all()

    def is_project_manager(self):
        g = Group.objects.get(name__iexact='project manager')
        return g in self.user.groups.all()

    def is_superuser(self):
        return self.user.is_superuser

    def hourly_cost_in_month(self, month_date):
        month_firstdate = month_date.replace(day=1)
        month_lastdate = (month_firstdate + datetime.timedelta(days=31)).replace(day=1) - datetime.timedelta(days=1)

        for contract in self.contracts.all():
            if contract.start_date <= month_lastdate and (contract.end_date or datetime.date.today()) >= month_firstdate:
                return contract.hourly_cost

        return 0

    def __unicode__(self):
        return u'{}'.format(self.user.username)

    class Meta:
        verbose_name = _('Worker')
        verbose_name_plural = _('Workers')


class WorkerContract(models.Model):
    CONTRACT_TYPES = Choices(
        (0, 'indeterminato', _('Fully employee')),
        (1, 'collaboratore', _('Collaboration to a project')),
        (2, 'partitaiva', _('External consultancy')),
    )

    worker = models.ForeignKey(Worker, verbose_name=_('worker'), related_name='contracts')
    contract_type = models.IntegerField(_('contract type'), choices=CONTRACT_TYPES, blank=True, null=True, help_text=_('The type of contract between the worker and the company'))
    start_date = models.DateField(_('start date'), help_text=_('When the contract started.'))
    end_date = models.DateField(_('end date'), null=True, blank=True, help_text=_('When the contract will end.'))
    time_perc = models.IntegerField(_('time percentage'), blank=True, null=True, help_text=_('Time percentage (100% = full time)'))
    hourly_cost = models.DecimalField(_('hourly cost'), max_digits=6, decimal_places=2)

    def __unicode__(self):
        import locale
        from django.conf import settings
        locale.setlocale(locale.LC_ALL, '{}.UTF-8'.format(settings.LANGUAGE_CODE.replace('-', '_')))
        return u'{} - {} ({} €/h)'.format(self.start_date.strftime('%x'), self.end_date.strftime('%x') if self.end_date else _('ongoing'), locale.format('%.2f', self.hourly_cost, grouping=True))

    class Meta:
        verbose_name = _('Contract')
        verbose_name_plural = _('Contracts')
        ordering = ['worker', 'start_date']


class ProjectQuerySet(models.query.QuerySet):
    def by_year(self, year):
        return self\
            .filter(Q(start_date__lte='{}-12-31'.format(year)) | Q(start_date__isnull=True) | Q(start_date=u''))\
            .filter(Q(end_date__gte='{}-01'.format(year)) | Q(end_date__isnull=True) | Q(end_date=u''))


class ProjectManager(models.Manager):
    def get_queryset(self):
        return ProjectQuerySet(self.model, using=self._db)

    def by_year(self, year):
        return self.get_queryset().by_year(year)


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

    name = models.CharField(_('name'), max_length=128, help_text=_("A project's name"))
    identification_code = models.CharField(_('identification code'), max_length=5, help_text=_('An alphanumeric identification code, max 5 chars'))
    description = models.TextField(_('description'), help_text=_('An extensive description of the project'))
    resources = models.TextField(_('resources'), help_text=_('A non-structured list of linked resources: github, staging, IP, ...'))
    customer = models.CharField(_('customer'), max_length=128, help_text=_('The identifier of the customer'))
    managers = models.ManyToManyField(Worker, related_name='manager_projects', help_text=_('The manager(s) of this project'))
    workers = models.ManyToManyField(Worker, related_name='worker_projects', help_text=_('The worker(s) of this project'))
    project_type = models.IntegerField(_('project type'), choices=TYPES, help_text=_('Whether the project is an ongoing activity or it has a start and an end date'))
    phase = models.IntegerField(_('phase'), choices=PHASES, null=True, blank=True, help_text=_('The status of advancement of the project'))
    status = models.IntegerField(_('status'), choices=STATUS, null=True, blank=True, help_text=_('Whether the project is active or closed'))
    gantt_url = models.URLField(_('TeamGantt URL'), blank=True, null=True, help_text=_('URL of the project on TeamGantt'))
    gdrive_url = models.URLField(_('GDrive URL'), blank=True, null=True, help_text=_('URL of the project on GDrive'))

    objects = ProjectManager()

    def __unicode__(self):
        return u'{} ({})'.format(self.name, self.identification_code)

    class Meta:
        verbose_name = _('Project')
        verbose_name_plural = _('Projects')


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
        (11, 'research', _('Research')),
    )

    project = models.ForeignKey(Project, verbose_name=_('project'))
    activity_type = models.IntegerField(_('activity type'), choices=TYPES, null=True, blank=True, help_text=_("Select the type of activity. Don't be picky."))
    description = models.CharField(_('description'), max_length=256, blank=True, null=True, help_text=_('A very brief description of the activity (max 256 chars).'))
    hours = models.DecimalField(_('hours worked'), max_digits=3, decimal_places=1, help_text=_('Number of hours worked, can be a decimal'))

    def __unicode__(self):
        return u'{}'.format(self.description)

    class Meta:
        abstract = True


class Activity(BaseActivity):
    worker = models.ForeignKey(Worker, verbose_name=_('worker'), related_name='assigned_activities')
    owner = models.ForeignKey(Worker, verbose_name=_('owner'), related_name='own_activities')
    activity_date = models.DateField(_('activity date'), help_text=_('Pick up the exact date of the activity.'))

    def __unicode__(self):
        return u'{} ({}h)'.format(self.description, self.hours)

    class Meta:
        verbose_name = _('Activity')
        verbose_name_plural = _('Activities')


class WeeklyActivity(BaseActivity):
    worker = models.ForeignKey(Worker, verbose_name=_('worker'), related_name='assigned_weekly_activities')
    owner = models.ForeignKey(Worker, verbose_name=_('owner'), related_name='own_weekly_activities')
    week = models.CharField(_('week'), max_length=7, help_text=_('The week'))

    def __unicode__(self):
        return u'{} ({}h)'.format(self.description, self.hours)

    class Meta:
        verbose_name = _('Weekly activity')
        verbose_name_plural = _('Weekly activities')


class RecurringActivity(BaseActivity):
    worker = models.ForeignKey(Worker, verbose_name=_('worker'), related_name='assigned_recurring_activities')
    owner = models.ForeignKey(Worker, verbose_name=_('owner'), related_name='own_recurring_activities')
    start_date = models.DateField(_('start date'), null=False, blank=False, default=0, help_text=_('When the activity started.'))
    end_date = models.DateField(_('end date'), null=True, blank=True, help_text=_('When the activity will end.'))
    recurrences = recurrence.fields.RecurrenceField(_('recurrences'), blank=True, null=True)

    class Meta:
        verbose_name = _('Recurring activity')
        verbose_name_plural = _('Recurring activities')
