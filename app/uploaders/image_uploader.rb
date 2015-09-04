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
     "http://res.cloudinary.com/bisonshare/image/upload/v1440349106/t2e3vvn0fl2ncp4ejcfb.jpg"
   end
  
end