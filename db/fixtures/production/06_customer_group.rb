CustomerGroup.seed_once do |cg|
  cg.id = 1
  cg.name = '初回チケット購入グループ'
end

CustomerGroup.seed_once do |cg|
  cg.id = 2
  cg.name = '継続利用グループ'
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 1
  cgp.customer_group_id = 1
  cgp.product_set_id = 1
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 2
  cgp.customer_group_id = 1
  cgp.product_set_id = 2
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 3
  cgp.customer_group_id = 1
  cgp.product_set_id = 3
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 4
  cgp.customer_group_id = 2
  cgp.product_set_id = 4
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 5
  cgp.customer_group_id = 2
  cgp.product_set_id = 5
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 6
  cgp.customer_group_id = 2
  cgp.product_set_id = 6
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 7
  cgp.customer_group_id = 2
  cgp.product_set_id = 7
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 8
  cgp.customer_group_id = 2
  cgp.product_set_id = 8
end

CustomerGroupProductSet.seed_once do |cgp|
  cgp.id = 9
  cgp.customer_group_id = 2
  cgp.product_set_id = 9
end