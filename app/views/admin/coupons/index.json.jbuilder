json.coupon_list do
  json.array! @coupons do |c|
    json.id c.id
    json.name c.name
    json.code c.code
    json.expiration c.expiration
    json.use_limit c.use_limit
    json.discount_amount c.discount_amount
  end
end
