FROM python:3.7-alpine
MAINTAINER Abdul Aziz   #  Maintainer of the project

ENV PYTHONUNBUFFERED 1

#  Install dependencies
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

#  Application source code directory
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#  User to run the application using docker
RUN adduser -D user
USER user
