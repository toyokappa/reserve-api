#!/bin/bash
ln -sf /dev/stdout /usr/src/app/log/${RAILS_ENV}.log
RAILS_ENV=${RAILS_ENV} bundle exec rails db:create
# RAILS_ENV=${RAILS_ENV} DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset # TODO: 忘れずに戻す
RAILS_ENV=${RAILS_ENV} bundle exec rails db:migrate
RAILS_ENV=${RAILS_ENV} bundle exec rails db:seed_fu
RAILS_ENV=${RAILS_ENV} bundle exec rails s