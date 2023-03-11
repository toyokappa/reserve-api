json.trainer do
  json.id @trainer.id
  json.first_name @trainer.first_name
  json.last_name @trainer.last_name
  json.display_name @trainer.display_name
  json.image @trainer.image
  json.comment @trainer.comment
  json.email @trainer.email
  json.frequency @trainer.frequency
end