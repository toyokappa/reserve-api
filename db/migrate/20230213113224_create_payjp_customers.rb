class CreatePayjpCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :payjp_customers do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :uid

      t.timestamps
    end

    add_index :payjp_customers, :uid, unique: true
  end
end
