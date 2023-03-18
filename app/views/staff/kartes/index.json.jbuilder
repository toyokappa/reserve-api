json.customer_list do
  json.array! @customers do |c|
    json.id c.id
    json.full_name c.full_name
    json.image c.image
    json.reservation_list do
      json.array! c.reservations do |cr|
        json.id cr.id
        json.scheduled_at cr.scheduled_at
        json.scheduled_date cr.scheduled_date
        json.scheduled_time cr.scheduled_time
        json.required_time cr.required_time
        json.program_name cr.program.name
      end
    end
  end
end