class AddPickupDetailsToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :phone, :string
    add_column :items, :address, :string
  end
end
