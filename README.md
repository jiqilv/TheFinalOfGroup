
# 学生预定课程系统

# 部署方式

> 1.还原数据库文件course.sql 并安装依赖

> 2.修改stu_course/settings.py 文件 数据库配置

```angular2

DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'course',
            'USER': 'root',
            'PASSWORD': 'root', 
            'HOST': '',
            'PORT': '3306',
        }
    }

```python manage.py runserver 8000

> 3.运行

# 依赖

> django==3.2.9 Pillow mysqlclient