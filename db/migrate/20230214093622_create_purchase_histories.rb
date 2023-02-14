class CreatePurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_histories do |t|
      t.string :product_set_name
      t.integer :total_amount
      t.integer :payment_method
      t.datetime :purchased_at
      t.string :payjp_charge_uid
      t.string :payjp_card_uid
      t.references :product_set, null: true, foreign_key: true
      t.references :customer, null: true, foreign_key: true
      t.json :meta

      t.timestamps
    end
  end
end
