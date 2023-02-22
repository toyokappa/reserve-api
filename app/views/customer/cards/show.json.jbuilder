if @card_in_use.present?
  json.in_use do
    json.number @card_in_use.last4
    json.brand @card_in_use.brand
    json.expiration "#{format('%02<month>d', month: @card_in_use.exp_month)}/#{@card_in_use.exp_year}"
    json.owner @card_in_use.name
  end
else
  json.in_use nil
end
json.registered do
  json.array! @cards_registered do |card|
    json.id card.id
    json.number card.last4
    json.brand card.brand
    json.expiration "#{format('%02<month>d', month: card.exp_month)}/#{card.exp_year}"
    json.owner card.name
  end
end