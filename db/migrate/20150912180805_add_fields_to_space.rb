class AddFieldsToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :parent_id, :integer
    add_column :spaces, :level, :integer
  end
end
