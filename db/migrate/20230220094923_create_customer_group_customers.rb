class CreateCustomerGroupCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_group_customers do |t|
      t.references :customer_group, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
