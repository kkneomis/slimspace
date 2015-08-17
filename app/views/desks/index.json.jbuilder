json.array!(@desks) do |desk|
  json.extract! desk, :id, :name, :price, :space_id, :user_id, :image, :description
  json.url desk_url(desk, format: :json)
end
