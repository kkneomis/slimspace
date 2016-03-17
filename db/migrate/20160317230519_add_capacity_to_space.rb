class AddCapacityToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :capacity, :integer
  end
end
