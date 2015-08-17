class AddRateToDesk < ActiveRecord::Migration
  def change
    add_column :desks, :rate, :float
  end
end
