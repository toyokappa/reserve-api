json.product do
  json.id @product_set.id
  json.name @product_set.name
  json.category @main_product.product_item.category
  json.number_of_item @main_product.number_of_item
  json.days_of_expiration @main_product.days_of_expiration
  json.product_item_list do
    json.array! @product_set.product_assigns do |pa|
      json.id pa.id
      json.name(pa.is_main? ? @product_set.name : pa.product_item.name)
      json.price pa.price
    end
  end
end