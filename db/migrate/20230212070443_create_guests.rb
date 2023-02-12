class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.string :message

      t.timestamps
    end

    add_index :guests, :email
    add_index :guests, :tel
  end
end
