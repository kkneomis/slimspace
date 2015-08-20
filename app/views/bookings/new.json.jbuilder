

json.array!(Booking.all) do |event|
  json.extract! event, :id
  json.title User.find(event.user_id).name
  json.start event.start_time
  json.end event.end_time
  json.url space_url(event, format: :html)
end