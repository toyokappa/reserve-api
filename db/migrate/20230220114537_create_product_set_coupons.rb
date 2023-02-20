class CreateProductSetCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :product_set_coupons do |t|
      t.references :product_set, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
