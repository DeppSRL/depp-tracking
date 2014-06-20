from django.contrib.auth.models import User
from django.db import models
from django.utils.translation import ugettext_lazy as _
from model_utils import Choices
from .behaviors import Dateframeable

__author__ = 'guglielmo'

class Employee(models.Model):
    user = models.OneToOneField(User)

    def __unicode__(self):
        return self.user.username

    class Meta:
        verbose_name = _("Employee")
        verbose_name_plural = _("Employees")


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
    managers = models.ManyToManyField(Employee, related_name='projects', help_text=_("The manager(s) of this project"))
    project_type = models.IntegerField(_('project type'), choices=TYPES, help_text=_("Whether the project is an ongoing activity or it has a start and an end date"))
    phase = models.IntegerField(_('phase'), choices=PHASES, null=True, blank=True, help_text=_("The status of advancement of the project"))
    status = models.IntegerField(_('status'), choices=STATUS, null=True, blank=True, help_text=_("Whether the project is active or closed"))

    def __unicode__(self):
        return u"{0} ({1})".format(self.name, self.identification_code)

    class Meta:
        verbose_name = _("Project")
        verbose_name_plural = _("Projects")


class Activity(models.Model):
    TYPES = Choices(
        (0, 'meeting', _('Meeting the customer')),
        (1, 'analysis', _('Analysis')),
        (2, 'design', _('Design')),
        (3, 'development', _('Development or debugging')),
        (4, 'data', _('Data management')),
        (5, 'content', _('Content management')),
        (6, 'management', _('Project management')),
        (7, 'graphic', _('Graphic design')),
        (8, 'marketing', _('Marketing and commercial activities')),
        (9, 'other', _('Other')),
    )

    employee = models.ForeignKey(Employee, related_name='assigned_activities')
    project = models.ForeignKey(Project)
    owner = models.ForeignKey(Employee, related_name='own_activities')
    date = models.DateField(auto_now=True, help_text=_("Pick up the exact date of the activity."))
    activity_type = models.IntegerField(choices=TYPES, null=True, blank=True, help_text=_("Select the type of activity. Don't be picky."))
    description = models.CharField(_("description"), max_length=256, help_text=_("A very brief description of the activity (max 256 chars)."))
    hours = models.DecimalField(_('Hours worked'), max_digits=3, decimal_places=1)

    def __unicode__(self):
        return u"{0} ({1}h)".format(self.description, self.hours)

    class Meta:
        verbose_name = _("Activity")
        verbose_name_plural = _("Activities")
