class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :resize_to_fill => [200, 200]
  end
  
  def default_url 
     "http://res.cloudinary.com/slimspace/image/upload/c_scale,w_200/v1442614866/default-avatar_djeehd.jpg"
   end
  
end