class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :space_id

      t.timestamps null: false
    end
  end
end
