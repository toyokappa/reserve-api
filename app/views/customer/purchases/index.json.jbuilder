json.product_list do
  json.array! @product_sets do |ps|
    json.id ps.id
    json.name ps.name
    json.description ps.description
    json.has_purchase_limit ps.has_purchase_limit
    json.purchase_limit ps.purchase_limit
    json.price ps.total_amount_only_main
  end
end

# TODO: 登録URLのQRコード
# TODO: 戻るUI
# TODO: 管理画面
#       顧客管理
#       シフト管理
#       売上管理
# TODO: カルテ