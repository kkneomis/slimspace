class StaticPageController < ApplicationController
  
  def contact
  end
  
  def about
    @spaces=Space.take(12)
  end
  
end
