class ContactsController < ApplicationController
  layout "static_page"
  def new
    redirect_to static_page_about
  end
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "Cannot send message."
    end
    redirect_to static_page_about_path
  end
end
