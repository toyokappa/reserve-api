class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :scheduled_date
      t.integer :required_time
      t.references :program,  null: false, foreign_key: true
      t.references :staff,    null: false, foreign_key: true
      t.references :customer, null: true,  foreign_key: true
      t.references :guest,    null: true,  foreign_key: true

      t.timestamps
    end
  end
end
