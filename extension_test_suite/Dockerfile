FROM ruby:2.6.6-alpine

RUN apk add --no-cache build-base

RUN gem install bundler
RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app 
