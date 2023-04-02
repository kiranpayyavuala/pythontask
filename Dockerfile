FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /my_app_dir
WORKDIR /my_app_dir
ADD requirements.txt /my_app_dir/
RUN pip install --upgrade pip && pip install -r requirements.txt
ADD . /my_app_dir/

RUN python manage.py makemigrations
RUN python manage.py migrate


#python manage.py runserver 0.0.0.0:8000
CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000"]
