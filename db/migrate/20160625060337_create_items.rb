class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :quantity, precision: 8, scale: 2
      t.string :description
      t.integer :price, precision: 8, scale: 2
      t.string :sku

      t.timestamps null: false
    end
  end
end
