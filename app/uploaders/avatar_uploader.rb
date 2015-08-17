class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :resize_to_fill => [200, 200]
  end

  
end