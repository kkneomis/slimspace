json.array!(Booking.all) do |booking|
  json.id booking.desk.space.id
  json.title User.find(booking.user_id).name
  json.start booking.start_time
  json.end booking.end_time
  json.url space_url(booking, format: :html)
end
