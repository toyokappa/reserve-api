class CreateProductItems < ActiveRecord::Migration[7.0]
  def change
    create_table :product_items do |t|
      t.string :name
      t.integer :category
      t.string :description

      t.timestamps
    end
  end
end
