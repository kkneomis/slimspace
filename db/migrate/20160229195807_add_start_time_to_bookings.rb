class AddStartTimeToBookings < ActiveRecord::Migration
  def up
    add_column :bookings, :start_time, :datetime
  end

  def down
  end
end
