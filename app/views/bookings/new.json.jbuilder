

json.array!(Booking.where(space_id: @space.id)) do |event|
  json.extract! event, :id
  json.title User.find(event.user_id).name
  json.start event.start_time
  json.end event.end_time
  json.url space_url(event, format: :html)
end