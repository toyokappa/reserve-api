json.product_list do
  json.array! @products do |product|
    json.id product.id
    json.name product.name
    json.description product.description
    json.price product.price
    json.has_purchase_limit product.has_purchase_limit
    json.purchase_limit product.purchase_limit
  end
end