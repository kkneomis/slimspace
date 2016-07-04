class PhotosController < ApplicationController
    
  def new
    @photo = Photo.new
    respond_with(@photo)
  end
    
  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to :back
  end
    
  private
    
  def photo_params
      params.require(:photo).permit(:image, :space_id)
    end
end
