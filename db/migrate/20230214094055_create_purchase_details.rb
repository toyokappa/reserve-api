class CreatePurchaseDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_details do |t|
      t.string :product_name
      t.integer :amount
      t.references :purchase_history, null: false, foreign_key: true
      t.references :product_assign, null: true, foreign_key: true
      t.json :meta

      t.timestamps
    end
  end
end
