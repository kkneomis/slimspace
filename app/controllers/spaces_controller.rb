class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  before_filter :check_privacy, only: [:show]
  #privacy

  def show
    @space = Space.find(params[:id])
    @owner = User.find(@space.user_id)
    @photos = Photo.where(:space_id => @space.id)
    @bookings = @space.bookings.order(start_time: :desc)
    #if @owner != current_user
    #  @desks = @space.desks.where(private: false)
    #else
    #  @desks= @space.desks.all
    #end
  end

  def index
    if params[:searchDateRange] && (params[:searchDateRange] != "")
      #byebug && 
          @range = params[:searchDateRange].to_s.split('- ')
          rstart = DateTime.strptime(@range[0], "%m/%d/%Y %I:%M %p")
          rend = DateTime.strptime(@range[1], "%m/%d/%Y %I:%M %p")
          @spaces = Space.find_by_sql ["select * from spaces where id not in (select space_id from bookings where (start_time >= ? and start_time < ?) or (start_time < ? and end_time > ?))", rstart, rend, rstart, rstart]
          @fin = 1 
    end
      
    if params[:capacity]
        @range = params[:capacity].split(',')
        min_cap = @range[0]
        max_cap = @range[1]
        if @spaces != nil
            @spaces = Space.find_by_sql ["select * from spaces s where s.number_of_seats between ? and ?", min_cap, max_cap] 
        else
            @spaces = @spaces.find_by_sql ["select * from spaces s where s.number_of_seats between ? and ?", min_cap, max_cap] 
        end
    end
    
    if @spaces == nil
      @spaces = Space.all
    end
    #if params[:searchDateRange]
    #  range = params[:searchDateRange].split('-')
    #else
    #  range = nil
    #end
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
      params.require(:space).permit(:name, :address, :description, :city, :state, :zip, :price, :number_of_seats, :user_id, :image, :parent_id, :level, :can_book, :private, :scale, :confirm, :searchDateRange)
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
