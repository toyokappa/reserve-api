class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :number_of_ticket
      t.integer :days_of_expiration
      t.boolean :has_purchase_limit
      t.integer :purchase_limit

      t.timestamps
    end
  end
end
