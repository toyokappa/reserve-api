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
# TODO: 限定チケット
# TODO: トースト
# TODO: クーポン
# TODO: 管理画面
#       スタッフの招待
#       シフト管理
#       売上管理
# TODO: マスターデータ登録
#       スタッフ
#       商品
#       プログラム
# TODO: カルテ