json.new_registered do
  json.array! @cards_registered do |card|
    json.id card.id
    json.number card.last4
    json.brand card.brand
    json.expiration "#{format('%02<month>d', month: card.exp_month)}/#{card.exp_year}"
    json.owner card.name
  end
end