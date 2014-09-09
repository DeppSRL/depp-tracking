from collections import OrderedDict
import csv
import locale
import csvkit
from dateutil.parser import parse
from django.db.models import Q
from django.http import HttpResponse, Http404
from django.views.generic import View
from rest_framework import viewsets, routers, serializers
from django.contrib.auth.models import Group, User
from .models import Worker, Project, Activity, HoursDict
from .serializers import UserSerializer, GroupSerializer, WorkerSerializer, ProjectSerializer, ActivitySerializer

__author__ = 'guglielmo'

# ViewSets define the view behavior.
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
        if self.request.user.is_superuser or self.request.user.worker.is_manager():
            return qs
        return qs.filter(Q(managers=self.request.user.worker) | Q(workers=self.request.user.worker))


class ActivityViewSet(viewsets.ModelViewSet):
    model = Activity
    serializer_class = ActivitySerializer

    def get_queryset(self):
        qs = super(ActivityViewSet, self).get_queryset()
        if self.request.user.is_superuser:
            return qs
        return qs.filter(owner=self.request.user.worker)


class CSVView(View):
    months = []

    def get_csv_filename(self):
        raise NotImplementedError

    def get_first_row(self):
        locale.setlocale(locale.LC_ALL, 'it_IT')
        first_row = map(lambda x: parse(x).strftime("%B %Y"), self.months[:])
        locale.setlocale(locale.LC_ALL, '')
        first_row.insert(0, u"")

        return first_row

    def write_csv(self, response):
        raise NotImplementedError

    def get(self, request, *args, **kwargs):
        # Create the HttpResponse object with the appropriate CSV header.
        response = HttpResponse(mimetype='text/csv')
        response['Content-Disposition'] = 'attachment; filename={0}.csv'.format(self.get_csv_filename())

        self.write_csv(response)

        return response


class WorkerCSVView(CSVView):

    def get_csv_filename(self):
        return 'report_worker_{0}'.format(self.worker)


    def write_csv(self, response):
        worker_hours = self.hours[self.worker]
        self.months = sorted(
            list(
                set(
                    val for sublist in [m.keys() for m in worker_hours.values()] for val in sublist
                )
            )
        )

        writer = csvkit.writer(response)
        writer.writerow(self.get_first_row())

        self.months.insert(0, u"")

        for p_code, data in worker_hours.items():
            row = []
            for month in self.months:
                if month == u"":
                    row.append(p_code)
                else:
                    if month in data:
                        row.append(data[month])
                    else:
                        row.append(0)

            writer.writerow(row)


    def get(self, request, *args, **kwargs):
        self.hours = HoursDict()
        self.worker = self.kwargs.get('worker','')

        if self.worker not in self.hours.keys():
            raise Http404

        return super(WorkerCSVView, self).get(request, *args, **kwargs)


class ProjectCSVView(CSVView):

    def get_csv_filename(self):
        return 'report_project_{0}'.format(self.project)

    def write_csv(self, response):
        project_hours = self.projects_hours[self.project]
        self.months = sorted(
            list(
                set(
                    val for sublist in [m.keys() for m in project_hours.values()] for val in sublist
                )
            )
        )

        writer = csvkit.writer(response)
        writer.writerow(self.get_first_row())

        self.months.insert(0, u"")

        for w_login, data in project_hours.items():
            row = []
            for month in self.months:
                if month == u"":
                    row.append(w_login)
                else:
                    if month in data:
                        row.append(data[month])
                    else:
                        row.append(0)

            writer.writerow(row)


    def get(self, request, *args, **kwargs):
        self.hours = HoursDict()
        self.project = self.kwargs.get('project','')
        self.projects = sorted(
            list(
                set(
                    val for sublist in [wh.keys() for wh in self.hours.values()] for val in sublist
                )
            )
        )
        self.projects_hours = OrderedDict([
            (p, OrderedDict([
                (w, self.hours[w][p]) for w in self.hours.keys() if p in self.hours[w]
                ])
            ) for p in self.projects
            ])

        if self.project not in self.projects:
            raise Http404

        return super(ProjectCSVView, self).get(request, *args, **kwargs)


class OverviewCSVView(CSVView):

    def get_csv_filename(self):
        return 'report_overview'


    def get_first_row(self):
        first_row = self.hours.keys()
        first_row.insert(0, u"")

        return first_row


    def write_csv(self, response):
        writer = csvkit.writer(response)
        writer.writerow(self.get_first_row())

        self.workers = self.hours.keys()
        self.workers.insert(0, u"")

        self.projects = sorted(
            list(
                set(
                    val for sublist in [wh.keys() for wh in self.hours.values()] for val in sublist
                )
            )
        )
        self.projects_hours = OrderedDict([
            (p, OrderedDict([
                (w, self.hours[w][p]) for w in self.hours.keys() if p in self.hours[w]
                ])
            ) for p in self.projects
            ])

        for p_code, data in self.projects_hours.items():
            row = []
            for w_login in self.workers:
                if w_login == u"":
                    row.append(p_code)
                else:
                    if w_login in data:
                        row.append(sum(data[w_login].values()))
                    else:
                        row.append(0)

            writer.writerow(row)

    def get(self, request, *args, **kwargs):
        self.hours = HoursDict()
        return super(OverviewCSVView, self).get(request, *args, **kwargs)
