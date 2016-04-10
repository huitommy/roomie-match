class RenameTypeColumnToCategory < ActiveRecord::Migration
  def change
    rename_column :dwellings, :type, :category
  end
end
