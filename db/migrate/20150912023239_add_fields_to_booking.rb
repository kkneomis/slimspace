class AddFieldsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :tenant_id, :integer
    add_column :bookings, :landlord_id, :integer
  end
end
