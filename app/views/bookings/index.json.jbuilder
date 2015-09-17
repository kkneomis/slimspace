
json.array!(Booking.all) do |booking|
  json.extract! booking, :id
  json.title "This time slot  is unavailable"
  json.start booking.start_time
  json.end booking.end_time
  json.url space_url(booking.space, format: :html)
end
