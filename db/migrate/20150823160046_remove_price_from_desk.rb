class RemovePriceFromDesk < ActiveRecord::Migration
  def change
    remove_column :desks, :price, :boolean
  end
end
