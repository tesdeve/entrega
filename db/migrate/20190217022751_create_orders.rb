class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :description
      t.decimal :weight
      t.decimal :length
      t.decimal :width
      t.decimal :heigth
      t.string :pickup_address
      t.float :pu_lat
      t.float :pu_lng
      t.datetime :pu_time
      t.string :delivery_address
      t.float :dy_lat
      t.float :dy_lng
      t.datetime :dy_time
      t.decimal :cost
      t.integer :status, :default => 0
      t.integer :radius
      t.belongs_to :sender, foreign_key: true
      t.belongs_to :transporter, foreign_key: true

      t.timestamps
    end
    add_index :orders, [:pu_lat, :pu_lng]
    add_index :orders, [:dy_lat, :dy_lng]
  end
end
