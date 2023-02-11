class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.references :staff, null: false, foreign_key: true
      t.datetime :work_time

      t.timestamps
    end

    add_index :shifts, [:staff_id, :work_time],     unique: true
  end
end
