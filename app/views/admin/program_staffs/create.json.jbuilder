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