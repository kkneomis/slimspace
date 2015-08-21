
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :manage]
    
  def show
    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
  
  def manage
    
  end
  
 private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    end
end