from django.contrib import admin
from app.models import *
from django.contrib.auth.admin import User, Group



# Register your models here.


class StuAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'password', 'nickname')


class TeaAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'nickname')


class CourseAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'teacher', 'address', 'term')
    list_filter = ("teacher__nickname",)


class CourseRecordAdmin(admin.ModelAdmin):
    list_display = ('id', 'course', 'student',)
    list_filter = ("course__teacher__nickname", "course__name", "student")


admin.site.site_header = '选课管理'
admin.site.site_title = '选课管理'
admin.site.register(Student, StuAdmin)
admin.site.register(Teacher, TeaAdmin)
admin.site.register(Course, CourseAdmin)
admin.site.register(CourseRecord, CourseRecordAdmin)
admin.site.unregister(User)
admin.site.unregister(Group)
