# -*- coding: utf-8 -*-
from collections import OrderedDict
import locale
import csvkit
import datetime
from dateutil.parser import parse
from django.conf import settings
# from django.db.models import Q
from django.http import HttpResponse, Http404
from django.views.generic import View, TemplateView
from isoweek import Week
# from rest_framework import viewsets
# from django.contrib.auth.models import Group, User
from models import Worker, Project, Activity, WeeklyActivity, RecurringActivity
from hoursdict import HoursDict
# from .serializers import UserSerializer, GroupSerializer, WorkerSerializer, ProjectSerializer, ActivitySerializer


__author__ = 'guglielmo'


# class UserViewSet(viewsets.ModelViewSet):
#     model = User
#     serializer_class = UserSerializer


# class GroupViewSet(viewsets.ModelViewSet):
#     model = Group
#     serializer_class = GroupSerializer


# class WorkerViewSet(viewsets.ModelViewSet):
#     model = Worker
#     serializer_class = WorkerSerializer


# class ProjectViewSet(viewsets.ModelViewSet):
#     model = Project
#     serializer_class = ProjectSerializer
#
#     def get_queryset(self):
#         qs = super(ProjectViewSet, self).get_queryset()
#         if not self.request.user.is_superuser and not self.request.user.worker.is_manager():
#             qs = qs.filter(Q(managers=self.request.user.worker) | Q(workers=self.request.user.worker))
#
#         return qs


# class ActivityViewSet(viewsets.ModelViewSet):
#     model = Activity
#     serializer_class = ActivitySerializer
#
#     def get_queryset(self):
#         qs = super(ActivityViewSet, self).get_queryset()
#         if not self.request.user.is_superuser:
#             qs = qs.filter(owner=self.request.user.worker)
#
#         return qs


class ReportsView(TemplateView):
    def get_context_data(self, **kwargs):
        context = super(ReportsView, self).get_context_data(**kwargs)

        years1 = set(year.year for year in Activity.objects.dates('activity_date', 'year'))
        years2 = set(year.year for year in RecurringActivity.objects.dates('start_date', 'year'))
        years3 = set(year.year for year in RecurringActivity.objects.dates('end_date', 'year'))
        years4 = set(Week.fromstring(week).year for week in WeeklyActivity.objects.values_list('week', flat=True).distinct())

        context['years'] = sorted(years1 | years2 | years3 | years4, reverse=True)

        # context['workers'] = Worker.objects.exclude(user__username='admin').order_by('user__username')
        # context['projects'] = Project.objects.order_by('-status', 'name')

        return context


class CSVView(View):
    breakdown_type = None
    period = None
    hours = None

    def get(self, request, *args, **kwargs):
        if settings.DEBUG:
            response = HttpResponse(content_type='text/plain; charset=utf-8')
        else:
            response = HttpResponse(content_type='text/csv; charset=utf-8')
            response['Content-Disposition'] = 'attachment; filename={}.csv'.format(self.get_csv_filename())

        self.write_csv(response)

        return response

    def get_csv_filename(self):
        raise NotImplementedError

    def write_csv(self, response):
        raise NotImplementedError

    def format_breakdowns(self, breakdowns):
        formatted_breakdowns = breakdowns[:]

        if self.breakdown_type == 'M':
            locale.setlocale(locale.LC_ALL, '{}.UTF-8'.format(settings.LANGUAGE_CODE.replace('-', '_')))
            formatted_breakdowns = map(lambda x: parse(x).strftime('%B %Y'), formatted_breakdowns)
            locale.setlocale(locale.LC_ALL, '')

        return formatted_breakdowns

    def get_request_params(self):
        self.breakdown_type = self.kwargs.get('breakdown_type')
        self.period = self.kwargs.get('period')

        if self.period == 'all':
            self.year = None
        elif self.period == 'latest':
            self.year = datetime.date.today().year
        else:
            self.year = self.period

        self.hours = HoursDict(breakdown_type=self.breakdown_type, year=self.year)


class WorkerCSVView(CSVView):
    worker = None

    def get(self, request, *args, **kwargs):
        self.get_request_params()
        self.worker = self.kwargs.get('worker')

        if self.worker not in self.hours:
            raise Http404

        return super(WorkerCSVView, self).get(request, *args, **kwargs)

    def get_csv_filename(self):
        return 'report_worker_{}_{}_{}'.format(self.worker, self.breakdown_type, self.period)

    def write_csv(self, response):
        worker = Worker.objects.select_related('user').prefetch_related('contracts').get(user__username=self.worker)

        projects = Project.objects.filter(identification_code__in=self.hours[self.worker].keys())
        if self.year:
            projects = projects.by_year(self.year)
        projects = projects.order_by('id')

        breakdowns = sorted(list(set(val for sublist in [m.keys() for m in self.hours[self.worker].values()] for val in sublist)))

        writer = csvkit.writer(response)
        writer.writerow(['codice progetto', 'nome progetto'] + self.format_breakdowns(breakdowns) + ['totale ore', 'totale giorni', 'costo'])

        for project in projects:
            worker_hours = OrderedDict([(bd, self.hours[self.worker][project.identification_code].get(bd, 0)) for bd in breakdowns])

            total_hours = sum(worker_hours.values())

            total_cost = sum([worker.hourly_cost_in_month(datetime.datetime.strptime(bd, HoursDict.key_date_format).date()) * hours for bd, hours in worker_hours.items()])

            row = [project.identification_code, project.name] + worker_hours.values() + [total_hours, round(total_hours / 8, 1), round(total_cost, 2)]
            writer.writerow(row)


class ProjectCSVView(CSVView):
    project = None

    def get(self, request, *args, **kwargs):
        self.get_request_params()
        self.project = self.kwargs.get('project')

        if self.project not in set(val for sublist in [wh.keys() for wh in self.hours.values()] for val in sublist):
            raise Http404

        return super(ProjectCSVView, self).get(request, *args, **kwargs)

    def get_csv_filename(self):
        return 'report_project_{}_{}_{}'.format(self.project, self.breakdown_type, self.period)

    def write_csv(self, response):
        project_hours = OrderedDict([(w, self.hours[w][self.project]) for w in self.hours if self.project in self.hours[w]])

        breakdowns = sorted(list(set(val for sublist in [m.keys() for m in project_hours.values()] for val in sublist)))

        writer = csvkit.writer(response)
        writer.writerow(['lavoratore'] + self.format_breakdowns(breakdowns))

        for worker, data in project_hours.items():
            row = [worker] + [data.get(bd, 0) for bd in breakdowns]
            writer.writerow(row)


class OverviewCSVView(CSVView):
    def get(self, request, *args, **kwargs):
        self.get_request_params()

        return super(OverviewCSVView, self).get(request, *args, **kwargs)

    def get_csv_filename(self):
        return 'report_overview_{}'.format(self.period)

    def write_csv(self, response):
        workers = Worker.objects.exclude(worker_type=Worker.TYPES.associate)
        if self.year:
            workers = workers.by_year(self.year)
        workers = workers.select_related('user').prefetch_related('contracts')

        workers_by_username = {w.user.username: w for w in workers}

        projects = Project.objects.filter(identification_code__in=set(val for sublist in [wh.keys() for wh in self.hours.values()] for val in sublist))
        if self.year:
            projects = projects.by_year(self.year)
        projects = projects.order_by('id')

        writer = csvkit.writer(response)
        writer.writerow(['codice progetto', 'nome progetto'] + [worker for worker in self.hours if worker in workers_by_username] + ['totale ore', 'totale giorni', 'costo'])

        for project in projects:
            workers_hours = [sum(self.hours[worker].get(project.identification_code, {}).values()) for worker in self.hours if worker in workers_by_username]
            workers_cost = [sum([workers_by_username[worker].hourly_cost_in_month(datetime.datetime.strptime(month, HoursDict.key_date_format).date()) * hours for month, hours in self.hours[worker].get(project.identification_code, {}).items()]) for worker in self.hours if worker in workers_by_username]

            total_hours = sum(workers_hours)
            total_cost = sum(workers_cost)

            row = [project.identification_code, project.name] + workers_hours + [total_hours, round(total_hours / 8, 1), round(total_cost, 2)]
            writer.writerow(row)
