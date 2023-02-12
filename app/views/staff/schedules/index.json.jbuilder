json.reservation_list do
  json.array! @reservations do |reservation|
    json.id reservation.id
    json.scheduled_date I18n.l(reservation.scheduled_date, format: :date_short)
    json.scheduled_time reservation.scheduled_time
    json.required_time reservation.required_time
    json.program_name reservation.program.name
    json.trainee reservation.guest&.name || reservation.customer.full_name
  end
end