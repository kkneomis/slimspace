class Space < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  has_many :users, through: :bookings
  has_many :desks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  
  ratyrate_rateable "space"
end
