json.array!(@desks) do |desk|
  json.extract! desk, :id, :name, :rate, :space_id, :user_id, :image, :description
  json.url space_url(desk, format: :json)
end
