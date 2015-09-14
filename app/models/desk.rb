class Desk < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  belongs_to :space
  ratyrate_rateable "desk"
end
