class Space < ActiveRecord::Base

  #validates :name, :capacity, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  mount_uploader :image, ImageUploader
  
  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
  has_many :photos, dependent: :destroy
  
  ratyrate_rateable "space"

  def full_street_address
    [address, city, state].compact.join(', ')
  end
end
