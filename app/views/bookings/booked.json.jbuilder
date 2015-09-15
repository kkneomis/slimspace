json.array!(Booking.where(tenant_id: current_user.id)) do |booking|
  json.extract! booking, :id
  json.title booking.space.name
  json.start booking.start_time
  json.end booking.end_time
  json.url space_url(booking.space, format: :html)
end