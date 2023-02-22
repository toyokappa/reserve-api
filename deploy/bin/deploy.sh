#! /bin/bash

# エラーで処理中断
set -ex

# build&deploy共通の環境変数取り込み
source ${BASH_SOURCE%/*}/env.sh

export SHA1=$1
export ENV=$2
export APP_PREFIX=${APP_NAME}-${ENV}

export NGINX_MEMORY=128
export RAILS_MEMORY=768
export DESIRED_COUNT_NGINX=1
export DESIRED_COUNT_RAILS=1
export RAILS_ENV=${ENV}

deploy() {
  echo "########################################### generate rails task definition start"

  ruby ./deploy/scripts/gen_task_definition.rb \
    --env_file ./deploy/config/${ENV}.env \
    --secrets-file ./deploy/config/secrets.yml \
    --task-definition-template ./deploy/task_definitions/rails_template.json | jq '.' > task_definitions_rails.json
  cat task_definitions_rails.json

  echo "########################################### generate rails task definition end"

  echo "########################################### update rails task definition start"

  aws ecs register-task-definition \
    --cli-input-json file://task_definitions_rails.json \
    --region ap-northeast-1

  local latest_task_definition_rails=$(latest_task_definition ${APP_PREFIX}-rails)

  aws ecs update-service \
    --cluster ${APP_PREFIX}-cluster \
    --service ${APP_PREFIX}-rails \
    --task-definition ${latest_task_definition_rails} \
    --desired-count ${DESIRED_COUNT_RAILS} \
    --region ap-northeast-1

  echo "########################################### update rails task definition end"
}
export -f deploy

deploy