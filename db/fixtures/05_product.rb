ProductItem.seed_once do |pi|
  pi.id = 1
  pi.name = 'パーソナルチケット'
  pi.category = :ticket
end

ProductItem.seed_once do |pi|
  pi.id = 2
  pi.name = '入会金'
  pi.category = :other
end

ProductSet.seed_once do |ps|
  ps.id = 1
  ps.name = 'トライアルコース'
  ps.description = 'まずはお試しで利用したい方へ。コース料金とは別に22,000円の入会金もお支払いいただきます。'
  ps.has_purchase_limit = true
  ps.purchase_limit = 1
  ps.publish_state = :limited
end

ProductSet.seed_once do |ps|
  ps.id = 2
  ps.name = 'ショートコース'
  ps.description = '短期間で引き締まった身体を目指したい方へ。コース料金とは別に22,000円の入会金もお支払いいただきます。'
  ps.has_purchase_limit = true
  ps.purchase_limit = 1
  ps.publish_state = :limited
end

ProductSet.seed_once do |ps|
  ps.id = 3
  ps.name = 'スタンダードコース'
  ps.description = 'しっかりと時間を掛けtえプロポーションを改善したい方へ。コース料金とは別に22,000円の入会金もお支払いいただきます。'
  ps.has_purchase_limit = true
  ps.purchase_limit = 1
  ps.publish_state = :limited
end

ProductSet.seed_once do |ps|
  ps.id = 4
  ps.name = '継続利用チケット1回分'
  ps.has_purchase_limit = false
  ps.publish_state = :limited
end

ProductSet.seed_once do |ps|
  ps.id = 5
  ps.name = '継続利用チケット8回分'
  ps.has_purchase_limit = false
  ps.publish_state = :limited
end

ProductSet.seed_once do |ps|
  ps.id = 6
  ps.name = '継続利用チケット16回分'
  ps.has_purchase_limit = false
  ps.publish_state = :limited
end

ProductAssign.seed_once do |pa|
  pa.id = 1
  pa.product_set_id = 1
  pa.product_item_id = 1
  pa.price = 104000
  pa.number_of_item = 8
  pa.days_of_expiration = 45
  pa.is_main = true
end

ProductAssign.seed_once do |pa|
  pa.id = 2
  pa.product_set_id = 1
  pa.product_item_id = 2
  pa.price = 22000
  pa.number_of_item = 1
end

ProductAssign.seed_once do |pa|
  pa.id = 3
  pa.product_set_id = 2
  pa.product_item_id = 1
  pa.price = 192000
  pa.number_of_item = 16
  pa.days_of_expiration = 75
  pa.is_main = true
end

ProductAssign.seed_once do |pa|
  pa.id = 4
  pa.product_set_id = 2
  pa.product_item_id = 2
  pa.price = 22000
  pa.number_of_item = 1
end

ProductAssign.seed_once do |pa|
  pa.id = 5
  pa.product_set_id = 3
  pa.product_item_id = 1
  pa.price = 276000
  pa.number_of_item = 24
  pa.days_of_expiration = 105
  pa.is_main = true
end

ProductAssign.seed_once do |pa|
  pa.id = 6
  pa.product_set_id = 3
  pa.product_item_id = 2
  pa.price = 22000
  pa.number_of_item = 1
end

ProductAssign.seed_once do |pa|
  pa.id = 7
  pa.product_set_id = 4
  pa.product_item_id = 1
  pa.price = 13000
  pa.number_of_item = 1
  pa.days_of_expiration = 30
  pa.is_main = true
end

ProductAssign.seed_once do |pa|
  pa.id = 8
  pa.product_set_id = 5
  pa.product_item_id = 1
  pa.price = 96000
  pa.number_of_item = 8
  pa.days_of_expiration = 75
  pa.is_main = true
end

ProductAssign.seed_once do |pa|
  pa.id = 9
  pa.product_set_id = 6
  pa.product_item_id = 1
  pa.price = 184000
  pa.number_of_item = 16
  pa.days_of_expiration = 135
  pa.is_main = true
end