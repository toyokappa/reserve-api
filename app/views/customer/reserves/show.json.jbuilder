json.program_list do
  json.array! @programs do |program|
    json.id program.id
    json.name program.name
    json.required_time program.required_time
    json.required_ticket program.required_ticket
    json.description program.description
    json.trainer_list do
      json.array! program.staffs do |staff|
        json.id staff.id
        json.name staff.display_name
        json.comment staff.comment
      end
    end
  end
end
