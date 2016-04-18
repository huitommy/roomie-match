class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.boolean :pets, default: false
      t.integer :smoking, null: false
      t.integer :drinking, null: false
      t.integer :music, null: false
      t.integer :vegetarian, null: false
      t.integer :cleanliness, null: false
      t.integer :parties, null: false
      t.integer :sports, null: false
      t.belongs_to :user, null: false
    end
  end
end
