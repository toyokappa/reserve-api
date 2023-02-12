class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :required_time
      t.string :description
      t.integer :required_ticket
      t.integer :publish_target
      t.integer :use_limit

      t.timestamps
    end
  end
end
