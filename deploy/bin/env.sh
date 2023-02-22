#! /bin/bash

export APP_NAME=sympl-reserve-api
export AWS_ACCOUNT_ID=648401562011
export CONTAINER_REGISTRY=${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-1.amazonaws.com

# タスク定義のprefixから最新のタスク定義のarnを返す
# latest_task_definition sympl-reserve-api-production
# => arn:aws:ecs:ap-northeast-1:648401562011:task-definition/sympl-reserve-api-production:43
latest_task_definition() {
  local cluster_name=$1
  aws ecs list-task-definitions --family-prefix $cluster_name --sort DESC --max-items 1 --region ap-northeast-1 | jq -r '.taskDefinitionArns[0]'
}
export -f latest_task_definition