json.program_list do
  json.array! @programs do |program|
    json.id program.id
    json.name program.name
    json.required_time program.required_time
    json.required_ticket program.required_ticket
    json.description program.description
  end
end