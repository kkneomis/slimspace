class UsersController < ApplicationController
  before_action :set_user, only: [:show]
    
  def show
    @spaces = Space.where(user_id: @user.id)
    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
  
  def manage
    @user = current_user
    @bookings = Booking.where(landlord_id: current_user.id)
  end
  
 private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    end
  
end