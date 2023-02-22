Coupon.seed_once do |c|
  c.id = 1
  c.name = "入会金無料キャンペーン"
  c.code = "ABCDEFG"
  c.discount_amount = 22000
  c.expiration = Time.current + 30.days
  c.use_limit = 1
end

ProductSetCoupon.seed_once do |pc|
  pc.id = 1
  pc.product_set_id = 1
  pc.coupon_id = 1
end

ProductSetCoupon.seed_once do |pc|
  pc.id = 2
  pc.product_set_id = 2
  pc.coupon_id = 1
end

ProductSetCoupon.seed_once do |pc|
  pc.id = 3
  pc.product_set_id = 3
  pc.coupon_id = 1
end