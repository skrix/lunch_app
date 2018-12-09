FROM ruby:2.5.1-alpine

RUN apk update && apk add build-base git nodejs python2 postgresql-dev postgresql-client

RUN mkdir /lunch_app
WORKDIR /lunch_app

COPY Gemfile /lunch_app/Gemfile
COPY Gemfile.lock /lunch_app/Gemfile.lock
RUN bundle install

COPY . /lunch_app
