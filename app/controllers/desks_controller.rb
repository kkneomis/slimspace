class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy]
   before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # GET /desks
  # GET /desks.json
  def index
    @desks = Desk.all
  end

  # GET /desks/1
  # GET /desks/1.json
  def show
  end

  # GET /desks/new
  def new
    @desk = Desk.new
     @space = Space.find(params[:space_id])
  end

  # GET /desks/1/edit
  def edit
  end

  # POST /desks
  # POST /desks.json
 
  def create
    @desk = Desk.new(desk_params)
    @space = Space.find(params[:space_id])
    @desk.space_id = @space.id
    @desk.user_id = current_user.id  
    
  
    
    respond_to do |format|
      if @desk.save
        format.html { redirect_to @space, notice: 'Desk was successfully created.' }
        format.json { render :show, status: :created, location: @desk.space }
      else
        format.html { render :new }
        format.json { render json: @desk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desks/1
  # PATCH/PUT /desks/1.json
  def update
    respond_to do |format|
      if @desk.update(desk_params)
        format.html { redirect_to @desk, notice: 'Desk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @desk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desks/1
  # DELETE /desks/1.json
  def destroy
    @desk.destroy
    respond_to do |format|
      format.html { redirect_to desks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desk
      @desk = Desk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desk_params
      params.require(:desk).permit(:name, :price, :space_id, :user_id, :image, :description, :rate)
    end
end
