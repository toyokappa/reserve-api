class CreateProgramStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :program_staffs do |t|
      t.references :program, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
