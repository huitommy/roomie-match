class CreateDwellings < ActiveRecord::Migration
  def change
    create_table :dwellings do |t|
      t.string :address, null:false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :type, null: false
      t.integer :bedrooms, null: false
      t.float :bathrooms, null: false
      t.integer :sq_ft, null: false
      t.integer :rent, null: false
      t.boolean :parking, default: false
    end
  end
end
