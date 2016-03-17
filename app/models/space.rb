class Space < ActiveRecord::Base

  validates :name, presence: true
  validates :capacity, numericality:{ greater_than: 0}

  mount_uploader :image, ImageUploader
  
  has_many :users, through: :bookings
  has_many :desks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  
  ratyrate_rateable "space"
end
