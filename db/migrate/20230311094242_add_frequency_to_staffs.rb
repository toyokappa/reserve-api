class AddFrequencyToStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :frequency, :integer, default: 1, null: false
  end
end
