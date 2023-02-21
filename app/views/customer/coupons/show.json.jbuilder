json.coupon do
  json.id @coupon.id
  json.product_name @coupon.name
  json.amount -@coupon.discount_amount
end