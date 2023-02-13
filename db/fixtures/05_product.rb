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
  ps.name = '2ヶ月コース'
  ps.description = 'コース料金とは別に40,000円の入会金もお支払いいただきます。'
  ps.has_purchase_limit = true
  ps.purchase_limit = 1
end

ProductSet.seed_once do |ps|
  ps.id = 2
  ps.name = 'ビジターチケット'
  ps.has_purchase_limit = false
end

ProductAssign.seed_once do |pa|
  pa.id = 1
  pa.product_set_id = 1
  pa.product_item_id = 1
  pa.price = 192000
  pa.number_of_item = 16
  pa.days_of_expiration = 75
  pa.is_main = true
end

ProductAssign.seed_once do |pa|
  pa.id = 2
  pa.product_set_id = 1
  pa.product_item_id = 2
  pa.price = 40000
  pa.number_of_item = 1
end

ProductAssign.seed_once do |pa|
  pa.id = 3
  pa.product_set_id = 2
  pa.product_item_id = 1
  pa.price = 14980
  pa.number_of_item = 1
  pa.days_of_expiration = 30
  pa.is_main = true
end