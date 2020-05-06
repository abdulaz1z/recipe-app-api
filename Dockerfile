FROM python:3.7-alpine
MAINTAINER Abdul Aziz   #  Maintainer of the project

ENV PYTHONUNBUFFERED 1

#  Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#  Application source code directory
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#  User to run the application using docker
RUN adduser -D user
USER user
