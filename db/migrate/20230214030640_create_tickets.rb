class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product_set, null: true, foreign_key: true
      t.references :reservation, null: true, foreign_key: true
      t.string :name
      t.datetime :expiration

      t.timestamps
    end
  end
end
