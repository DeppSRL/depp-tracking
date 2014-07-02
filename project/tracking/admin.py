from django.contrib import admin
from django.core.exceptions import ObjectDoesNotExist
from django.forms import ModelForm, MultipleChoiceField
from .models import Project, Worker, Activity, RecurringActivity

__author__ = 'guglielmo'

def _get_user_groups(request):
    return [g.lower() for g in request.user.groups.values_list('name', flat=True)]

class WorkerAdmin(admin.ModelAdmin):
    pass


class ProjectAdmin(admin.ModelAdmin):
    search_fields = ['^description']
    list_filter = ('phase', 'status', 'project_type')

    def get_queryset(self, request):
        """
        project managers can only list projects they manage

        superusers and global managers see them all
        :param request:
        :return:
        """
        qs = super(ProjectAdmin, self).queryset(request)
        if request.user.is_superuser or 'manager' in _get_user_groups(request):
            return qs
        return qs.filter(managers=request.user.worker)


class BaseActivityAdmin(admin.ModelAdmin):
    def get_queryset(self, request):
        qs = super(BaseActivityAdmin, self).queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(owner=request.user.worker)

    def get_list_filter(self, request):
        lf = super(BaseActivityAdmin, self).get_list_filter(request)[:]
        if 'project manager' not in _get_user_groups(request) and not request.user.is_superuser:
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

        user_groups_names = _get_user_groups(request)

        # the logged user is always the owner of the activity
        # only superusers can change that
        if db_field.name == 'owner':
            if not request.user.is_superuser:
                field.queryset = field.queryset.filter(id=request.user.worker.id)

        # employees can only add their own activities
        if db_field.name == 'worker':
            if 'manager' not in user_groups_names \
                    and'project manager' not in user_groups_names \
                    and not request.user.is_superuser:
                field.queryset = field.queryset.filter(id=request.user.worker.id)

        # employees can only add their own activities
        if db_field.name == 'project':
            if 'manager' not in user_groups_names and not request.user.is_superuser:
                field.queryset = field.queryset.filter(managers=request.user.worker)

        return field

class ActivityAdmin(BaseActivityAdmin):
    list_display = ['__unicode__', 'worker', 'project', 'activity_date']
    search_fields = ['description',]
    list_filter = ['worker', 'project', 'activity_type', 'activity_date', 'project__status']


class RecurringActivityAdmin(BaseActivityAdmin):
    list_display = ['__unicode__', 'worker', 'project', 'recurrences']
    list_filter = ['worker', 'project', 'activity_type', 'project__status']

admin.site.register(Worker, WorkerAdmin)
admin.site.register(Project, ProjectAdmin)
admin.site.register(Activity, ActivityAdmin)
admin.site.register(RecurringActivity, RecurringActivityAdmin)
