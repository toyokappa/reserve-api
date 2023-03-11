class AddFrequencyToStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :frequency, :integer, default: 5, null: false
  end
end
