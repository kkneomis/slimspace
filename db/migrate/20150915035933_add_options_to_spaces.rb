class AddOptionsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :private, :boolean
    add_column :spaces, :can_book, :boolean
  end
end
