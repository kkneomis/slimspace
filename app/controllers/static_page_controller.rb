class StaticPageController < ApplicationController
  
  def contact
  end
  
  def about
    @spaces=Space.take(12)
      if user_signed_in?
          redirect_to spaces_path
      end
  end
  
end
