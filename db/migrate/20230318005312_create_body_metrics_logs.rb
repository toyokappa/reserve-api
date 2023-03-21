class CreateBodyMetricsLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :body_metrics_logs do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :staff, null: true, foreign_key: true
      t.references :reservation, null: true, foregin_key: true
      t.string :photo
      t.datetime :logged_at

      t.timestamps
    end
  end
end
