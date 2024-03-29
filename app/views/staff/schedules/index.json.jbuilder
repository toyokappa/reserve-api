if @next_reservation.present?
  json.next_reservation do
    json.id @next_reservation.id
    json.scheduled_date @next_reservation.scheduled_date
    json.scheduled_time @next_reservation.scheduled_time
    json.required_time @next_reservation.required_time
    json.program_name @next_reservation.program.name
    json.trainee @next_reservation.guest&.name || @next_reservation.customer.full_name
  end
else
  json.next_reservation nil
end
json.reservation_list do
  json.array! @reservations do |reservation|
    json.id reservation.id
    json.scheduled_date reservation.scheduled_date
    json.scheduled_time reservation.scheduled_time
    json.required_time reservation.required_time
    json.program_name reservation.program.name
    json.trainee reservation.guest&.name || reservation.customer.full_name
  end
end