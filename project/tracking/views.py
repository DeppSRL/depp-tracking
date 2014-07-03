from django.db.models import Q
from rest_framework import viewsets, routers, serializers
from django.contrib.auth.models import Group, User
from .models import Worker, Project, Activity
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
