class AddApprovalToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :approved, :boolean
  end
end
