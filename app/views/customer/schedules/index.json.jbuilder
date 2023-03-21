json.reservation_list do
  json.array! @reservations do |reservation|
    json.id reservation.id
    json.scheduled_date reservation.scheduled_date
    json.scheduled_time reservation.scheduled_time
    json.required_time reservation.required_time
    json.program_name reservation.program.name
    json.trainer reservation.staff.display_name
  end
end