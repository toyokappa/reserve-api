Product.seed_once do |p|
  p.id = 1
  p.name = '2ヶ月コース'
  p.description = 'コース料金とは別に40,000円の入会金もお支払いいただきます。'
  p.price = 192000
  p.number_of_ticket = 16
  p.days_of_expiration = 75
  p.has_purchase_limit = true
  p.purchase_limit = 1
end

Product.seed_once do |p|
  p.id = 2
  p.name = 'ビジターチケット'
  p.price = 14980
  p.number_of_ticket = 1
  p.days_of_expiration = 30
  p.has_purchase_limit = false
end