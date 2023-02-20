class CreateCustomerGroupProductSets < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_group_product_sets do |t|
      t.references :customer_group, null: false, foreign_key: true
      t.references :product_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
