class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :resize_to_fill => [570, 400]
  end

  version :thumbnail do
    process :resize_to_fill => [350, 200]
  end
  
  version :mini do
    process :resize_to_fill => [262, 180]
  end
  
   def default_url 
     "http://res.cloudinary.com/slimspace/image/upload/v1442614484/office-170638_1280_cj2ovp.jpg"
   end
  
end