json.product do
  json.id @product_set.id
  json.name @product_set.name
  json.category @main_product.product_item.category
  json.number_of_item @main_product.number_of_item
  json.days_of_expiration @main_product.days_of_expiration
  json.has_usable_coupons @has_usable_coupons
  json.product_item_list do
    json.array! @product_set.product_assigns do |pa|
      json.id pa.id
      json.product_name(pa.is_main? ? @product_set.name : pa.product_item.name)
      json.amount pa.price
    end
  end
end
if @card.present?
  json.card_info do
    json.number @card.last4
    json.brand @card.brand
    json.expiration "#{format('%02<month>d', month: @card.exp_month)}/#{@card.exp_year}"
    json.owner @card.name
  end
end