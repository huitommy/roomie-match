class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :user, null: false
      t.belongs_to :dwelling, null: false
      t.integer :score, null: false
    end
  end
end
