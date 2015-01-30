# coding=utf-8
from django.conf import settings
from django.contrib import admin
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django.db.models import Q
from django import forms
from django.utils.translation import ugettext_lazy as _
import locale
from isoweek import Week
from .models import Project, Worker, Activity, RecurringActivity, WeeklyActivity

__author__ = 'guglielmo'


class ProjectAdminForm(forms.ModelForm):
    """
    Custom form for Project administration: managers and workers widgets
    are changed to more user-friendly checkboxes.
    """
    class Meta:
        model = Project
        widgets = {
          'managers':forms.CheckboxSelectMultiple,
          'workers':forms.CheckboxSelectMultiple
        }

class WorkerAdmin(admin.ModelAdmin):

    def report_w_latest_url(self, obj):
        url = reverse('worker_csv', args=['W',obj.user.username,'latest'])
        return u'<a href="{0}">scarica</a>'.format(url)

    def report_m_latest_url(self, obj):
        url = reverse('worker_csv', args=['M',obj.user.username,'latest'])
        return u'<a href="{0}">scarica</a>'.format(url)


    def report_w_all_url(self, obj):
        url = reverse('worker_csv', args=['W',obj.user.username,'all'])
        return u'<a href="{0}">scarica</a>'.format(url)

    def report_m_all_url(self, obj):
        url = reverse('worker_csv', args=['M',obj.user.username,'all'])
        return u'<a href="{0}">scarica</a>'.format(url)

    report_w_all_url.allow_tags = True
    report_m_all_url.allow_tags = True
    report_w_latest_url.allow_tags = True
    report_m_latest_url.allow_tags = True

    report_w_all_url.short_description = "Report settimanale globale"
    report_m_all_url.short_description = "Report mensile globale"
    report_w_latest_url.short_description = "Report settimanale anno corrente"
    report_m_latest_url.short_description = "Report mensile anno corrente"

    list_display = ('__unicode__', 'report_w_latest_url', 'report_m_latest_url', 'report_w_all_url', 'report_m_all_url')


class ProjectAdmin(admin.ModelAdmin):
    
    def report_w_latest_url(self, obj):
        url = reverse('project_csv', args=['W',obj.identification_code,'latest'])
        return u'<a href="{0}">scarica</a>'.format(url)

    def report_m_latest_url(self, obj):
        url = reverse('project_csv', args=['M',obj.identification_code,'latest'])
        return u'<a href="{0}">scarica</a>'.format(url)

    def report_w_all_url(self, obj):
        url = reverse('project_csv', args=['W',obj.identification_code,'all'])
        return u'<a href="{0}">scarica</a>'.format(url)

    def report_m_all_url(self, obj):
        url = reverse('project_csv', args=['M',obj.identification_code,'all'])
        return u'<a href="{0}">scarica</a>'.format(url)

    report_w_all_url.allow_tags = True
    report_m_all_url.allow_tags = True
    report_w_latest_url.allow_tags = True
    report_m_latest_url.allow_tags = True

    report_w_all_url.short_description = "Report settimanale globale"
    report_m_all_url.short_description = "Report mensile globale"
    report_w_latest_url.short_description = "Report settimanale anno corrente"
    report_m_latest_url.short_description = "Report mensile anno corrente"

    search_fields = ['^description', 'identification_code']
    list_filter = ('phase', 'status', 'project_type')
    list_display = ('__unicode__', 'report_w_latest_url', 'report_m_latest_url', 'report_w_all_url', 'report_m_all_url')
    form = ProjectAdminForm



    def formfield_for_manytomany(self, db_field, request=None, **kwargs):
        """
        Managers selections is filtered

        :param db_field:
        :param request:
        :param kwargs:
        :return:
        """
        field = super(ProjectAdmin, self).formfield_for_manytomany(
            db_field, request, **kwargs
        )
        if db_field.name == 'managers':
            field.queryset = field.queryset.filter(
                Q(user__groups__name__iexact='manager') |
                Q(user__groups__name__iexact='project manager')
            ).distinct()
        else:
            pass

        return field

    def get_queryset(self, request):
        """
        project managers or workers can only list 'their' projects

        superusers and global managers see them all
        :param request:
        :return:
        """
        qs = super(ProjectAdmin, self).queryset(request)
        if request.user.is_superuser or request.user.worker.is_manager():
            return qs
        return qs.filter(Q(managers=request.user.worker) | Q(workers=request.user.worker)).distinct()


class BaseActivityAdmin(admin.ModelAdmin):

    def get_queryset(self, request):
        qs = super(BaseActivityAdmin, self).queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(owner=request.user.worker).distinct()

    def get_list_filter(self, request):
        lf = super(BaseActivityAdmin, self).get_list_filter(request)[:]
        if request.user.worker.is_project_manager() and not request.user.is_superuser:
            if 'worker' in lf:
                lf.remove('worker')
        return lf


    def formfield_for_foreignkey(self, db_field, request=None, **kwargs):
        if db_field.name == 'owner' or db_field.name == 'worker':
            try:
                kwargs['initial'] = request.user.worker
            except ObjectDoesNotExist:
                pass

        field = super(BaseActivityAdmin, self).formfield_for_foreignkey(
            db_field, request, **kwargs
        )

        # the logged user is always the owner of the activity
        # only superusers can change that
        if db_field.name == 'owner':
            if not request.user.is_superuser:
                field.queryset = field.queryset.filter(id=request.user.worker.id).distinct()

        # employees can only add their own activities
        if db_field.name == 'worker':
            if not request.user.worker.is_manager() \
                    and not request.user.worker.is_project_manager() \
                    and not request.user.is_superuser:
                field.queryset = field.queryset.filter(id=request.user.worker.id).distinct()

        # employees can only see projects they work in or manage
        if db_field.name == 'project':
            # order the project field choices by name
            field.queryset = field.queryset.order_by('name')
            
            if request.user.worker.is_manager() and not request.user.is_superuser:
                field.queryset = field.queryset.filter(
                    Q(managers=request.user.worker) | Q(workers=request.user.worker)
                ).distinct()
        return field

class ActivityAdmin(BaseActivityAdmin):
    list_display = ['__unicode__', 'worker', 'project', 'activity_date']
    ordering = ['-activity_date']
    search_fields = ['description',]
    list_filter = ['worker', 'project', 'activity_type', 'activity_date', 'project__status']


class RecurringActivityAdmin(BaseActivityAdmin):
    list_display = ['__unicode__', 'worker', 'project', 'recurrences']
    list_filter = ['worker', 'project', 'activity_type', 'project__status']
    ordering = ['-end_date', '-start_date']


class WeeklyAdminForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        locale.setlocale(locale.LC_ALL, "{0}.UTF-8".format(settings.LANGUAGE_CODE.replace("-","_")))
        from_word = _("from")
        w = Week.thisweek()
        WEEKS = [(w.isoformat(), _("this week"))] + [((w - i).isoformat(), _("from") + (w-i).monday().strftime(" %d %B")) for i in range(1, settings.PAST_WEEKS_IN_REPORTS)]
        super(WeeklyAdminForm, self).__init__(*args, **kwargs)

        self.fields['week'].widget = forms.Select(choices = WEEKS)

    class Meta:
        model = WeeklyActivity

class WeeklyActivityAdmin(BaseActivityAdmin):
    list_display = ['__unicode__', 'worker', 'project', 'week']
    list_filter = ['worker', 'project', 'activity_type', 'project__status']
    ordering = ['-week']

    form = WeeklyAdminForm

admin.site.register(Worker, WorkerAdmin)
admin.site.register(Project, ProjectAdmin)
admin.site.register(Activity, ActivityAdmin)
admin.site.register(RecurringActivity, RecurringActivityAdmin)
admin.site.register(WeeklyActivity, WeeklyActivityAdmin)
