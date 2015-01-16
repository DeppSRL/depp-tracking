from rest_framework import serializers
from django.contrib.auth.models import Group, User
from .models import Worker, Project, Activity

__author__ = 'guglielmo'

class DynamicFieldsHyperlinkedModelSerializer(serializers.HyperlinkedModelSerializer):
    """
    A HyperlinkedModelSerializer that takes an additional `fields` argument that
    controls which fields should be displayed.
    """

    def __init__(self, *args, **kwargs):
        # Don't pass the 'fields' arg up to the superclass
        fields = kwargs.pop('fields', None)

        # Instantiate the superclass normally
        super(DynamicFieldsHyperlinkedModelSerializer, self).__init__(*args, **kwargs)

        if fields:
            # Drop any fields that are not specified in the `fields` argument.
            allowed = set(fields)
            existing = set(self.fields.keys())
            for field_name in existing - allowed:
                self.fields.pop(field_name)


class UserSerializer(DynamicFieldsHyperlinkedModelSerializer):
  class Meta:
    model = User
    fields = (
        'url', 'username', 'email', 'first_name', 'last_name', 'is_staff', 'is_active', 'date_joined', 'groups', 'worker'
    )


class GroupSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = Group
    fields = ('url', 'name',)


class WorkerSerializer(DynamicFieldsHyperlinkedModelSerializer):
    user = UserSerializer(
        fields = (
            'username', 'email', 'first_name', 'last_name', 'is_staff', 'is_active', 'date_joined', 'groups',
        )
    )
    class Meta:
        model = Worker
        fields = ('url', 'user')


class ProjectSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Project


class ActivitySerializer(DynamicFieldsHyperlinkedModelSerializer):
    class Meta:
        model = Activity
