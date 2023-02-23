json.trainer_list do
  json.array! @trainers do |trainer|
    json.id trainer.id
    json.name trainer.display_name
    json.image trainer.image
    json.commet trainer.comment
  end
end