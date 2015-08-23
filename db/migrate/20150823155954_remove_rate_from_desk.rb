class RemoveRateFromDesk < ActiveRecord::Migration
  def change
    remove_column :desks, :rate, :float
  end
end
