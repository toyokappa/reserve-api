class CreateCustomerGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_groups do |t|
      t.string :name
      t.references :customer, null: true, foreign_key: true
      t.references :product_set, null: true, foreign_key: true

      t.timestamps
    end
  end
end
