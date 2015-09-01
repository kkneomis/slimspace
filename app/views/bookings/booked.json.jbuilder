json.array!(@bookings) do |booking|
  json.extract! booking, :id
  json.title booking.desk.name
  json.start booking.start_time
  json.end booking.end_time
  json.url space_url(booking.desk.space, format: :html)
end