json.purchase_history do
  json.id @history.id
  json.product_set_name @history.product_set_name
  json.total_amount @history.total_amount
  json.payment_method @history.payment_method_i18n
  json.purchased_at @history.purchased_at
  json.detail do
    json.array! @history.purchase_details do |detail|
      json.id detail.id
      json.product_name detail.product_name
      json.amount detail.amount
    end
  end
  json.card_info do
    json.number @card.last4
    json.brand @card.brand
    json.expiration "#{format('%02<month>d', month: @card.exp_month)}/#{@card.exp_year}"
    json.owner @card.name
  end
end