from django.db import models


# Create your models here.

class Student(models.Model):
    id = models.AutoField(primary_key=True, verbose_name="ID")
    username = models.CharField(max_length=10, verbose_name="学号")
    password = models.CharField(max_length=10, verbose_name="密码")
    nickname = models.CharField(max_length=10, verbose_name="姓名")

    def __str__(self):
        return self.nickname

    class Meta:
        verbose_name = "学生管理"
        verbose_name_plural = "学生管理"
class Teacher(models.Model):
    id = models.AutoField(primary_key=True, verbose_name="ID")
    username = models.CharField(max_length=10, verbose_name="工号")
    nickname = models.CharField(max_length=10, verbose_name="姓名")
    def __str__(self):
        return self.nickname
    class Meta:
        verbose_name = "教师管理"
        verbose_name_plural = "教师管理"
class Course(models.Model):
    terms = (
        (1, "上学期"),
        (2, "下学期"),
    )
    id = models.AutoField(primary_key=True, verbose_name="ID")
    name = models.CharField(max_length=10, verbose_name="课程名字")
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, verbose_name="授课教师")
    address = models.CharField(max_length=20, verbose_name="上课地点")
    term = models.IntegerField(choices=terms, default=1, verbose_name="学期")
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = "课程管理"
        verbose_name_plural = "课程管理"
class CourseRecord(models.Model):
    id = models.AutoField(primary_key=True, verbose_name="ID")
    course = models.ForeignKey(Course, on_delete=models.CASCADE, verbose_name="课程")
    student = models.ForeignKey(Student, on_delete=models.CASCADE, verbose_name="学生")
    date = models.DateTimeField("创建时间", auto_now=True)
    def __str__(self):
        return str(self.id)
    class Meta:
        verbose_name = "选课管理"
        verbose_name_plural = "选课管理"
