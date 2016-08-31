FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /vattentornet
WORKDIR /vattentornet
ADD Gemfile /vattentornet/Gemfile
ADD Gemfile.lock /vattentornet/Gemfile.lock
RUN bundle install
ADD . /vattentornet
