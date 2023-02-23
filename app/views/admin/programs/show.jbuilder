json.program do
  json.id @program.id
  json.name @program.name
  json.required_time @program.required_time
  json.required_ticket @program.required_ticket
  json.description @program.description
end
json.assigned_trainer_list do
  json.array! @assigned_trainers do |trainer|
    json.id trainer.id
    json.name trainer.display_name
    json.image trainer.image
    json.comment trainer.comment
  end
end
json.wait_trainer_list do
  json.array! @wait_trainers do |trainer|
    json.id trainer.id
    json.name trainer.display_name
    json.image trainer.image
    json.comment trainer.comment
  end
end