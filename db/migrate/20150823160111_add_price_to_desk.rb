class AddPriceToDesk < ActiveRecord::Migration
  def change
    add_column :desks, :price, :float
  end
end
