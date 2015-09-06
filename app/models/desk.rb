class Desk < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  has_many :bookings
  belongs_to :space, dependent: :destroy
  ratyrate_rateable "desk"
end
