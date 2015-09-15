class AddScaleToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :scale, :string
  end
end
