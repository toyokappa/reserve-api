class RenameScheduledDateColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :scheduled_date, :scheduled_at
  end
end
