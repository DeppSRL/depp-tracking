from django.contrib import admin
from django.core.exceptions import ObjectDoesNotExist
from .models import Project, Worker, Activity

__author__ = 'guglielmo'

class WorkerAdmin(admin.ModelAdmin):
    pass

class ProjectAdmin(admin.ModelAdmin):
    search_fields = ['^description']
    list_filter = ('phase', 'status', 'project_type')

class ActivityAdmin(admin.ModelAdmin):
    list_display = ['__unicode__', 'worker', 'project', 'date']
    search_fields = ['description',]
    list_filter = ['worker', 'project', 'activity_type', 'date']

    def _get_user_groups(self, request):
        return [g.lower() for g in request.user.groups.values_list('name', flat=True)]

    def get_queryset(self, request):
        qs = super(ActivityAdmin, self).queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(owner=request.user.worker)

    def get_list_filter(self, request):
        lf = super(ActivityAdmin, self).get_list_filter(request)[:]
        if 'project manager' not in self._get_user_groups(request) and not request.user.is_superuser:
            if 'worker' in lf:
                lf.remove('worker')
        return lf

    def formfield_for_foreignkey(self, db_field, request=None, **kwargs):
        if db_field.name == 'owner' or db_field.name == 'worker':
            try:
                kwargs['initial'] = request.user.worker
            except ObjectDoesNotExist:
                pass

        field = super(ActivityAdmin, self).formfield_for_foreignkey(
            db_field, request, **kwargs
        )

        user_groups_names = self._get_user_groups(request)

        # the logged user is always the owner of the activity
        # only superusers can change that
        if db_field.name == 'owner':
            if not request.user.is_superuser:
                field.queryset = field.queryset.filter(id=request.user.worker.id)

        # employees can only add their own activities
        if db_field.name == 'worker':
            if 'project manager' not in user_groups_names and not request.user.is_superuser:
                field.queryset = field.queryset.filter(id=request.user.worker.id)

        return field

admin.site.register(Worker, WorkerAdmin)
admin.site.register(Project, ProjectAdmin)
admin.site.register(Activity, ActivityAdmin)
