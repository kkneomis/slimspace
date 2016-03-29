class AddStartTimeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :start_time, :datetime
  end
end
