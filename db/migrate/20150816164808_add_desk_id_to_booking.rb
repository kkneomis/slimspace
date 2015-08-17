class AddDeskIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :desk_id, :integer
  end
end
