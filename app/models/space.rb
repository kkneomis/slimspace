class Space < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  has_many :users, through: :bookings
  has_many :desks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :children, class_name: 'Space', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Space'
  
  ratyrate_rateable "space"
end
