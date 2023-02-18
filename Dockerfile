FROM ruby:3.1.2

ENV APP_ROOT=/usr/src/app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN apt-get update && \
    apt-get -y install build-essential \
    libpq-dev \
    nodejs \
    default-mysql-client \
    imagemagick \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN gem update
RUN bundle install

ADD . $APP_ROOT

EXPOSE 3000
