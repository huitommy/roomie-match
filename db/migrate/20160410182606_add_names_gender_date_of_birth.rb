class AddNamesGenderDateOfBirth < ActiveRecord::Migration
  def change
    add_column :preferences, :first_name, :string,  null: false
    add_column :preferences, :last_name, :string, null: false
    add_column :preferences, :gender, :string, null: false
    add_column :preferences, :date_of_birth, :date, null: false
  end
end
