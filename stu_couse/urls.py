"""stu_couse URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from app.views import *

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('admin/', include('admin.urls')),
    path('login/', user_login),
    path('logout/', logout),
    path('index/', course_page),
    path('course/', course_page),
    path('course_info/', course_info),
    path('select/', select_course),
    path('self_course/', self_course),
    path('refund/', refund),
    path('', course_page),
]
