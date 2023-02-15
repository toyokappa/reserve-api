json.ticket_list do
  json.array! @tickets do |ticket|
    json.id ticket[:id]
    json.name ticket[:name]
    json.expiration ticket[:expiration]
    json.number_of_ticket ticket[:number_of_ticket]
  end
end