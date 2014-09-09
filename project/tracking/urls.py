# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework import routers

from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.views.generic import TemplateView, RedirectView

# load admin modules
from django.contrib import admin

from .views import UserViewSet, GroupViewSet, WorkerViewSet, ProjectViewSet, ActivityViewSet, WorkerCSVView, \
    ProjectCSVView, OverviewCSVView

admin.autodiscover()



# Routers to REST-API Viewsets
router = routers.DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'groups', GroupViewSet)
router.register(r'workers', WorkerViewSet)
router.register(r'project', ProjectViewSet)
router.register(r'activity', ActivityViewSet)

urls = (
    url(r'^$', RedirectView.as_view(url="/admin", permanent=True)),

    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),

    # api auth
    url(r'^api/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    # csv per worker
    url(r'^report-worker/(?P<worker>.+).csv$', WorkerCSVView.as_view(), name='worker_csv'),
    # csv per project
    url(r'^report-project/(?P<project>.+).csv$', ProjectCSVView.as_view(), name='project_csv'),
    # csv overview
    url(r'^report-overview.csv$', OverviewCSVView.as_view(), name='overview_csv'),
)
urlpatterns = patterns('', *urls)

# static and media urls not works with DEBUG = True, see static function.
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += patterns('',
                            url(r'^__debug__/', include(debug_toolbar.urls)),
                            )
