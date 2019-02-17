class CreateSenders < ActiveRecord::Migration[5.2]
  def change
    create_table :senders do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :status, :default => 1

      t.timestamps
    end
    add_index :senders, [:latitude, :longitude]
  end
end
