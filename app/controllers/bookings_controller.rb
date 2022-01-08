class BookingsController < ApplicationController
  skip_after_action :verify_authorized, only: [:my_trips]
  after_action :verify_policy_scoped, only: [:my_trips]

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = Flat.find(params[:flat_id])
    @booking.user = current_user
    authorize(@booking)

    if @booking.save
      redirect_to flat_path(@booking.flat), notice: "Booking successful."
    else
      render :new
    end
  end

  def my_trips
    @bookings = policy_scope(Booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
