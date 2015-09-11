class AddPrivateToDesk < ActiveRecord::Migration
  def change
    add_column :desks, :private, :boolean
  end
end
