class CreateCustomerCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_coupons do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
