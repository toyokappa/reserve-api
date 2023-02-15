json.purchase_history_list do
  json.array! @histories do |history|
    json.id history.id
    json.product_set_name history.product_set_name
    json.total_amount history.total_amount
    json.payment_method history.payment_method_i18n
    json.purchased_at history.purchased_at
  end
end