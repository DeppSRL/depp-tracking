# coding=utf-8
from collections import OrderedDict
import locale
import csvkit
from dateutil.parser import parse
from django.conf import settings
from django.db.models import Q
from django.http import HttpResponse, Http404
from django.views.generic import View, TemplateView
from rest_framework import viewsets
from django.contrib.auth.models import Group, User
from .models import Worker, Project, Activity, HoursDict
from .serializers import UserSerializer, GroupSerializer, WorkerSerializer, ProjectSerializer, ActivitySerializer


__author__ = 'guglielmo'


class UserViewSet(viewsets.ModelViewSet):
    model = User
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    model = Group
    serializer_class = GroupSerializer


class WorkerViewSet(viewsets.ModelViewSet):
    model = Worker
    serializer_class = WorkerSerializer


class ProjectViewSet(viewsets.ModelViewSet):
    model = Project
    serializer_class = ProjectSerializer

    def get_queryset(self):
        qs = super(ProjectViewSet, self).get_queryset()
        if not self.request.user.is_superuser and not self.request.user.worker.is_manager():
            qs = qs.filter(Q(managers=self.request.user.worker) | Q(workers=self.request.user.worker))

        return qs


class ActivityViewSet(viewsets.ModelViewSet):
    model = Activity
    serializer_class = ActivitySerializer

    def get_queryset(self):
        qs = super(ActivityViewSet, self).get_queryset()
        if not self.request.user.is_superuser:
            qs = qs.filter(owner=self.request.user.worker)

        return qs


class ReportsView(TemplateView):
    def get_context_data(self, **kwargs):
        context = super(ReportsView, self).get_context_data(**kwargs)

        context['workers'] = Worker.objects.exclude(user__username='admin').order_by('user__username')
        context['projects'] = Project.objects.order_by('-status', 'name')

        return context


class CSVView(View):
    breakdown_type = None
    period_type = None
    only_latest_year = None
    hours = None
    breakdowns = []

    def get(self, request, *args, **kwargs):
        # Create the HttpResponse object with the appropriate CSV header.

        if settings.DEBUG:
            response = HttpResponse(mimetype='text/plain')
        else:
            response = HttpResponse(mimetype='text/csv')
            response['Content-Disposition'] = 'attachment; filename={}.csv'.format(self.get_csv_filename())

        self.write_csv(response)

        return response

    def get_csv_filename(self):
        raise NotImplementedError

    def get_first_row(self):
        first_row = self.breakdowns[:]

        if self.breakdown_type != 'W':
            locale.setlocale(locale.LC_ALL, 'it_IT')
            first_row = map(lambda x: parse(x).strftime('%B %Y'), first_row)
            locale.setlocale(locale.LC_ALL, '')

        first_row.insert(0, u'')

        return first_row

    def write_csv(self, response):
        raise NotImplementedError

    def get_request_params(self):
        self.breakdown_type = self.kwargs.get('breakdown_type')
        self.period_type = self.kwargs.get('period_type')

        self.only_latest_year = True
        if self.period_type == 'all':
            self.only_latest_year = False

        self.hours = HoursDict(breakdown_type=self.breakdown_type, only_latest_year=self.only_latest_year)


class WorkerCSVView(CSVView):
    worker = None
    projects = None

    def get(self, request, *args, **kwargs):
        self.get_request_params()
        self.worker = self.kwargs.get('worker')

        if self.worker not in self.hours.keys():
            raise Http404

        return super(WorkerCSVView, self).get(request, *args, **kwargs)

    def get_csv_filename(self):
        return 'report_worker_{}_{}_{}'.format(self.worker, self.breakdown_type, self.period_type)

    def write_csv(self, response):
        worker_hours = self.hours[self.worker]
        self.breakdowns = sorted(
            list(
                set(
                    val for sublist in [m.keys() for m in worker_hours.values()] for val in sublist
                )
            )
        )

        current_projects_codes = self.projects = Project.objects.latest_projects(). \
            order_by('identification_code').values_list('identification_code', flat=True)

        writer = csvkit.writer(response)
        writer.writerow(self.get_first_row())

        for project, data in worker_hours.items():
            # if only latest year show hours for latest projects
            if self.only_latest_year and project not in current_projects_codes:
                continue

            row = [project]
            for bd in self.breakdowns:
                if bd in data:
                    row.append(data[bd])
                else:
                    row.append(0)

            writer.writerow(row)


class ProjectCSVView(CSVView):
    project = None
    projects = None
    projects_hours = None

    def get(self, request, *args, **kwargs):
        self.get_request_params()
        self.project = self.kwargs.get('project')
        self.projects = sorted(
            list(
                set(
                    val for sublist in [wh.keys() for wh in self.hours.values()] for val in sublist
                )
            )
        )
        self.projects_hours = OrderedDict(
            [(
                p,
                OrderedDict([(w, self.hours[w][p]) for w in self.hours.keys() if p in self.hours[w]]),
            ) for p in self.projects]
        )

        if self.project not in self.projects:
            raise Http404

        return super(ProjectCSVView, self).get(request, *args, **kwargs)

    def get_csv_filename(self):
        return 'report_project_{}_{}_{}'.format(self.project, self.breakdown_type, self.period_type)

    def write_csv(self, response):
        project_hours = self.projects_hours[self.project]
        self.breakdowns = sorted(
            list(
                set(
                    val for sublist in [m.keys() for m in project_hours.values()] for val in sublist
                )
            )
        )

        writer = csvkit.writer(response)
        writer.writerow(self.get_first_row())

        for worker, data in project_hours.items():
            row = [worker]
            for bd in self.breakdowns:
                if bd in data:
                    row.append(data[bd])
                else:
                    row.append(0)

            writer.writerow(row)


class OverviewCSVView(CSVView):
    workers = None
    projects = None
    projects_hours = None

    def get(self, request, *args, **kwargs):
        # self.period_type = self.kwargs.get('period_type')

        # self.only_latest_year = True
        # if self.period_type == 'all':
        #     self.only_latest_year = False

        self.get_request_params()

        return super(OverviewCSVView, self).get(request, *args, **kwargs)

    def get_csv_filename(self):
        return 'report_overview'

    # def get_breakdown_type(self):
    #     return ''

    def get_first_row(self):
        first_row = self.workers[:]
        first_row.insert(0, u'')

        return first_row

    def write_csv(self, response):
        current_workers = [w.user.username for w in Worker.objects.exclude(worker_type=Worker.TYPES.associate).select_related('user')]
        self.workers = [k for k in self.hours.keys() if k in current_workers]

        # if only latest year -> the csv will have only rows for active project
        if self.only_latest_year:
            self.projects = Project.objects.latest_projects()
        else:
            self.projects = Project.objects.filter(identification_code__in=set(val for sublist in [wh.keys() for wh in self.hours.values()] for val in sublist))

        self.projects = self.projects.order_by('start_date').values_list('identification_code', flat=True)

        self.projects_hours = OrderedDict(
            [(
                p,
                OrderedDict([(w, self.hours[w][p]) for w in self.hours.keys() if p in self.hours[w]]),
            ) for p in self.projects]
        )

        writer = csvkit.writer(response)
        writer.writerow(self.get_first_row())

        for project, data in self.projects_hours.items():
            row = [project]
            for worker in self.workers:
                if worker in data:
                    row.append(sum(data[worker].values()))
                else:
                    row.append(0)

            writer.writerow(row)
