class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  before_filter :check_privacy, only: [:show]
  #privacy
  
  
  
  def show
    @space = Space.find(params[:id])  
     @owner = User.find(@space.user_id)
    if @owner != current_user
      @desks = @space.desks.where(private: false)
    else
      @desks= @space.desks.all
    end
  end
  

  
  def index
    @spaces = Space.where(parent_id: nil).order('created_at DESC')
    
  end

  def new
    @space = Space.new
    @parent= params[:parent]
  end

  def create
    @space = Space.new(space_params)
    @space.user_id = current_user.id
    
   respond_to do |format| 
    if @space.save
      format.html { redirect_to @space, notice: 'Space was successfully updated.' }
      format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
      format.json { render json: @space.errors, status: :unprocessable_entity }
    end
    end
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to spaces_path
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { render :show, status: :ok, location: @space}
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_space
    @space = Space.find(params[:id])
    end
  

    def space_params
      params.require(:space).permit(:name, :address, :description, :city, :state, :zip, :price, :number_of_seats, :user_id, :image, :parent_id, :level, :can_book, :private, :scale, :confirm)
    end
  
      def check_user
        if current_user.id != @space.user_id
          redirect_to root_url, alert: "Sorry, this Space belongs to someone else"\
        end
      end
  
      def check_privacy
        if (@space.private == true) && ((!user_signed_in?) || (current_user.id != @space.user_id))
          redirect_to root_url, alert: "Sorry, this Space is private"\
        end
      end
  
end
