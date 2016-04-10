class DeleteGenderAndDobFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :gender
    remove_column :users, :date_of_birth
  end
end
