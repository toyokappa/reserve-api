class CreateProductSets < ActiveRecord::Migration[7.0]
  def change
    create_table :product_sets do |t|
      t.string :name
      t.string :description
      t.boolean :has_purchase_limit
      t.integer :purchase_limit
      t.integer :publish_state, default: 1

      t.timestamps
    end
  end
end
