from django.conf.urls import url
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required, permission_required
from django.db.models.aggregates import Count
from django.shortcuts import render, redirect
from django.http import HttpRequest, HttpResponse
from django.db.models import Sum
from app.models import Student, Teacher, Course, CourseRecord
import os
import time
# Create your views here.


def home(request: HttpRequest):
    return redirect('/admin/student/')


def Login(request: HttpRequest):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        # 使用Django自带的authenticat()函数判断是否有该用户
        user = authenticate(username=username, password=password)
        # 如果存在该用户并且状态是激活的
        if user and user.is_active:
            # 使用Django的login()函数进行登陆
            login(request, user)

            # 如果记住登陆，则使用全局的过期时间，默认为2周
            request.session.set_expiry(None)

            # 获取next页面(原本要访问的页面，因为没登陆所以转到login页面了)，如果有的话则重定向到该页面
            next_url = request.GET.get('next') or "/admin/student"
            return redirect(next_url)
        else:
            return HttpResponse('用户名或密码错误！')

    return render(request, "admin/login.html")


def loginOut(request: HttpRequest):
    logout(request)
    return redirect('/admin/login')


@login_required(login_url="/admin/login/")
def student(request: HttpRequest):
    _list = Student.objects.filter().all()
    return render(request, 'admin/student.html', {'list': _list})


@login_required(login_url="/admin/login/")
def studentEdit(request: HttpRequest):
    id = request.GET.get("id") or "0"
    if request.method == "GET":
        _model = Student.objects.filter(id=int(id)).first()
        return render(request, 'admin/student_edit.html', {'model': _model, 'id': id})
    else:
        username = request.POST.get("username") or ""
        nickname = request.POST.get("nickname") or ""
        password = request.POST.get("password") or ""

        if username != "":
            if id == "0":
                Student.objects.create(
                    username=username,
                    nickname=nickname,
                    password=password,
                )
            else:
                Student.objects.filter(id=int(id)).update(
                    username=username,
                    nickname=nickname,
                    password=password,
                )
        return redirect("/admin/student")


@login_required(login_url="/admin/login/")
def studentDelete(request: HttpRequest):
    id = request.GET.get("id") or "0"
    Student.objects.filter(id=int(id)).delete()
    return redirect("/admin/student")


@login_required(login_url="/admin/login/")
def teacher(request: HttpRequest):
    _list = Teacher.objects.filter().all()
    return render(request, 'admin/teacher.html', {'list': _list})


@login_required(login_url="/admin/login/")
def teacherEdit(request: HttpRequest):
    id = request.GET.get("id") or "0"
    if request.method == "GET":
        _model = Teacher.objects.filter(id=int(id)).first()
        return render(request, 'admin/teacher_edit.html', {'model': _model, 'id': id})
    else:
        username = request.POST.get("username") or ""
        nickname = request.POST.get("nickname") or ""
        if username != "":
            if id == "0":
                Teacher.objects.create(
                    username=username,
                    nickname=nickname,
                )
            else:
                Teacher.objects.filter(id=int(id)).update(
                    username=username,
                    nickname=nickname,
                )
        return redirect("/admin/teacher")


@login_required(login_url="/admin/login/")
def teacherDelete(request: HttpRequest):
    id = request.GET.get("id") or "0"
    Teacher.objects.filter(id=int(id)).delete()
    return redirect("/admin/teacher")


@login_required(login_url="/admin/login/")
def course(request: HttpRequest):
    _list = Course.objects.filter().all()
    return render(request, 'admin/course.html', {'list': _list})


@login_required(login_url="/admin/login/")
def courseEdit(request: HttpRequest):
    id = request.GET.get("id") or "0"
    _tea = Teacher.objects.filter().all()
    if request.method == "GET":
        _model = Course.objects.filter(id=int(id)).first()
        return render(request, 'admin/course_edit.html', {'model': _model, 'id': id, 'tea': _tea})
    else:
        # 保存图片
        name = request.POST.get("name") or ""
        address = request.POST.get("address") or ""
        teacher = Teacher.objects.filter(id=int(request.POST.get("teacher") or "0")).first()
        term = request.POST.get("term")
        # print(tags)
        if name != "":
            if id == "0":
                _model = Course.objects.create(
                    name=name,
                    address=address,
                    teacher=teacher,
                    term=int(term),
                )
                _model.save()
            else:
                _model = Course.objects.filter(id=int(id)).first()
                _model.name = name
                _model.address = address
                _model.teacher = teacher
                _model.term = int(term)
                _model.save()

        return redirect("/admin/course")


@login_required(login_url="/admin/login/")
def courseDelete(request: HttpRequest):
    id = request.GET.get("id") or "0"
    Course.objects.filter(id=int(id)).delete()
    return redirect("/admin/course")


@login_required(login_url="/admin/login/")
def record(request: HttpRequest):
    _list = CourseRecord.objects.filter().all()
    return render(request, 'admin/record.html', {'list': _list})
