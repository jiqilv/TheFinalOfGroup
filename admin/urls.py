from django.urls import path, include, re_path
from admin.views import home, Login, loginOut, student, studentEdit, studentDelete, teacher, teacherEdit, teacherDelete, course, courseEdit, courseDelete, record

urlpatterns = [
    path('', home),
    path('login/', Login),
    path('loginOut/', loginOut),
    path('student/', student),
    path('student/edit/', studentEdit),
    path('student/delete/', studentDelete),
    path('teacher/', teacher),
    path('teacher/edit/', teacherEdit),
    path('teacher/delete/', teacherDelete),
    path('course/', course),
    path('course/edit/', courseEdit),
    path('course/delete/',  courseDelete),
    path('record/',  record),
]
