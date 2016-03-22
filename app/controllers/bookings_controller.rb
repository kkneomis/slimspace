class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :approve]
  before_action :check_landlord, only: [:approve]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  def booked
    @bookings= Booking.where(user_id: current_user.id)
  end
  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @space = Space.find(params[:space_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @booking }
    end
  end

  def approve
    @booking.update_attributes(approved: true)
    MailGun.reservation_success(@booking.space, @booking, @booking.landlord, @booking.landlord.email).deliver
    respond_to do |format|
      format.html { redirect_to manage_user_path, notice: 'This booking has been confirmed!' }
      MailGun.reservation_success(@booking.space, @booking, @booking.landlord, @booking.landlord.email).deliver
    end
  end
  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @space = Space.find(params[:space_id])
    @booking.space_id = @space.id
    @booking.user_id = current_user.id
    @booking.tenant_id = current_user.id
    @booking.landlord_id = @space.user_id
    if @space.confirm == true
      @booking.update_attributes(approved: true)
    end
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @space, notice: 'Booking was successfully created.' }
        MailGun.approve_deny(@space, @booking, @booking.landlord, @booking.landlord.email).deliver
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to manage_user_path, notice: 'Booking was successfully destroyed.' }
      MailGun.reservation_canceled(@booking.space, @booking, @booking.landlord, @booking.landlord.email).deliver
      format.json { head :no_content }
    end
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start, :end, :user_id, :space_id, :start_time, :end_time, :length, :desk_id, :landlord_id, :tenant_id, :approved)
    end

  def check_landlord
    if current_user != @booking.landlord
      redirect_to root_path, notice: 'You cannot approve this booking'
    end
  end

end
