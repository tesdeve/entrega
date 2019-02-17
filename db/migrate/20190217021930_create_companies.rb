class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :radius
      t.integer :status, :default => 1

      t.timestamps
    end
    add_index :companies, [:latitude, :longitude]
  end
end
