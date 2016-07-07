class StaticPageController < ApplicationController
  
  def contact
  end
  
  def about
    @contact = Contact.new
    @spaces=Space.take(12)
      if user_signed_in?
          redirect_to spaces_path
      end
  end
end
