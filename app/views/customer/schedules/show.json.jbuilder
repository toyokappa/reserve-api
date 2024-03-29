json.reservation do
  json.id @reservation.id
  json.scheduled_date @reservation.scheduled_date
  json.scheduled_time @reservation.scheduled_time
  json.required_time @reservation.required_time
  json.program_name @reservation.program.name
  json.trainer @reservation.staff.display_name
  json.disabled_cancel @reservation.scheduled_at.ago(24.hours) < Time.current
  json.ticket_list do
    json.array! @reservation.tickets do |ticket|
      json.id ticket.id
      json.name ticket.name
      json.expiration ticket.expiration
    end
  end
end