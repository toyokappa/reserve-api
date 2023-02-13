class CreateProductAssigns < ActiveRecord::Migration[7.0]
  def change
    create_table :product_assigns do |t|
      t.references :product_set, null: false, foreign_key: true
      t.references :product_item, null: false, foreign_key: true
      t.integer :price
      t.integer :number_of_item
      t.integer :days_of_expiration
      t.boolean :is_main

      t.timestamps
    end
  end
end
