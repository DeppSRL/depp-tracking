# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.decorators import login_required
from rest_framework import routers

from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.views.generic import TemplateView, RedirectView

# load admin modules
from django.contrib import admin

from .views import UserViewSet, GroupViewSet, WorkerViewSet, ProjectViewSet, ActivityViewSet, WorkerCSVView, \
    ProjectCSVView, OverviewCSVView, ReportsView

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

    # csv reports
    url(r'^reports/$', login_required(ReportsView.as_view(template_name="reports.html")), name="reports"),

    # reports workers
    url(r'^reports/worker/(?P<breakdown_type>[\w-]+)/(?P<worker>[\w-]+)_(?P<period_type>[\w-]+).csv$', WorkerCSVView.as_view(), name='worker_csv'),

    # reports projects
    url(r'^reports/project/(?P<breakdown_type>[\w-]+)/(?P<project>[\w-]+)_(?P<period_type>[\w-]+).csv$', ProjectCSVView.as_view(), name='project_csv'),

    # overview
    url(r'^report/overview.csv$', OverviewCSVView.as_view(), name='overview_csv'),
)
urlpatterns = patterns('', *urls)

# static and media urls not works with DEBUG = True, see static function.
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG_TOOLBAR:
    import debug_toolbar
    urlpatterns += patterns('',
                            url(r'^__debug__/', include(debug_toolbar.urls)),
                            )
