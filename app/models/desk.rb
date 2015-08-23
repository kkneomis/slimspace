class Desk < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  has_many :bookings
  belongs_to :space
  ratyrate_rateable "desk"
end
