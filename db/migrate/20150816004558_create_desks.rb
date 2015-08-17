class CreateDesks < ActiveRecord::Migration
  def change
    create_table :desks do |t|
      t.string :name
      t.integer :space_id
      t.integer :user_id
      t.string :image
      t.text :description

      t.timestamps null: false
    end
  end
end
