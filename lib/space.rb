class Space < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  has_many :users, through: :bookings
  has_many :desks, dependent: :destroy
  
  has_many :children, class_name: 'Space', foreign_key: 'parent_id'
  
  ratyrate_rateable "space"
end
