class AddConfirmationsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :confirm, :boolean
  end
end
