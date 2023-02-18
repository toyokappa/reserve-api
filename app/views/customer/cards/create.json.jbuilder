json.new_card do
  json.id @new_card.id
  json.number @new_card.last4
  json.expiration "#{format('%02<month>d', month: @new_card.exp_month)}/#{@new_card.exp_year}"
  json.owner @new_card.name
end