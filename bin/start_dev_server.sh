#!/bin/bash
set -ex

bundle install

if [ "${MANUAL}" = "" ]; then
  RAILS_ENV=${RAILS_ENV} bundle exec rails db:create
  RAILS_ENV=${RAILS_ENV} bundle exec rails db:migrate
  RAILS_ENV=${RAILS_ENV} bundle exec rails db:seed_fu
  rm -f tmp/pids/server.pid
  RAILS_ENV=${RAILS_ENV} bundle exec rails server -b 0.0.0.0
else
  echo "******* MANUAL MODE *******"
  echo start the server with the following command.
  echo "# start rails server"
  echo "railse server -b 0.0.0.0"
  tail -f < /dev/null
fi
