class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :code
      t.integer :discount_amount
      t.datetime :expiration
      t.integer :use_limit

      t.timestamps
    end

    add_index :coupons, :code, unique: true

    add_reference :purchase_histories, :coupon, null: true, foreign_key: true
    add_reference :purchase_details, :coupon, null: true, foreign_key: true
  end
end
