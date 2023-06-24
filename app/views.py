from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse
from app.models import *


# Create your views here.

def check(func):
    def wra(req, *arg, **kwargs):
        if not req.session.get('username'):
            return redirect("/login")
        return func(req, *arg, **kwargs)

    return wra


def user_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        passwd = request.POST['password']
        user = Student.objects.filter(username=username, password=passwd)
        if user:
            request.session["username"] = username
            return HttpResponse("0")
        else:
            return HttpResponse("1")
    else:
        return render(request, 'login.html')


@check
# 用户注销
def logout(request):
    request.session.flush()
    response = HttpResponse("注销成功")
    response['Refresh'] = "2;/index/"
    return response


@check
# 选课信息
def course_page(request):
    return render(request, 'course.html')


@check
# 获取选课详细信息
def course_info(request):
    condition = {}
    if request.POST.get('course'):
        condition['course'] = request.POST.get('course')

    if request.POST.get('teacher'):
        condition['teacher'] = request.POST.get('teacher')

    if request.POST.get('address'):
        condition['address'] = request.POST.get('address')

    if request.POST.get('term'):
        condition['term'] = request.POST.get('term')

    if condition:
        courses = Course.objects
        for key, value in condition.items():
            if key == 'course':
                courses = courses.filter(name=condition['course'])
            if key == 'teacher':
                courses = courses.filter(teacher__nickname=condition['teacher'])
            if key == 'address':
                courses = courses.filter(address=condition['address'])
            if key == 'term':
                courses = courses.filter(term=condition['term'])
    else:
        courses = Course.objects.all()

    course_result = []
    for c in courses:
        course_result.append({
            'id': c.id,
            'name': c.name,
            'teacher': c.teacher.nickname,
            'address': c.address,
            'term': c.get_term_display(),
        })
    return JsonResponse(course_result, safe=False)


@check
# 选课
def select_course(request):
    course_id = int(request.GET.get("course_id"))
    course = Course.objects.get(id=course_id)
    username = request.session['username']
    user = Student.objects.get(username=username)
    cr = CourseRecord.objects.filter(course=course, student=user)
    if cr:
        return JsonResponse({"code": 200, "detail": "已选择该课程！"})
    CourseRecord.objects.create(course=course, student=user)
    return JsonResponse({"code": 200, "detail": "选课成功！"})
@check
# 退课
def refund(request):
    id = request.GET.get("id")
    cr = CourseRecord.objects.get(id=id)
    cr.delete()
    return JsonResponse({"code": 200, "detail": "退课成功！"})


@check
# 已选课程
def self_course(request):
    username = request.session['username']
    user = Student.objects.get(username=username)
    cr = CourseRecord.objects.filter(student=user)
    return render(request, 'self_course.html', {"cr": cr})
