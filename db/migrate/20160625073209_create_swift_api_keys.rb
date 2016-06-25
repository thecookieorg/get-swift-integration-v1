class CreateSwiftApiKeys < ActiveRecord::Migration
  def change
    create_table :swift_api_keys do |t|
      t.string :key

      t.timestamps null: false
    end
  end
end
