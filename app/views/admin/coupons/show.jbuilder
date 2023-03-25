json.coupon do
  json.id @coupon.id
  json.name @coupon.name
  json.code @coupon.code
  json.expiration @coupon.expiration
  json.use_limit @coupon.use_limit
  json.discount_amount @coupon.discount_amount
end

json.assigned_product_list do
  json.array! @assigned_products do |p|
    json.id p.id
    json.name p.name
  end
end

json.unassigned_product_list do
  json.array! @unassigned_products do |p|
    json.id p.id
    json.name p.name
  end
end