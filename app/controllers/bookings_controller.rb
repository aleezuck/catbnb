class BookingsController < ApplicationController
  skip_after_action :verify_authorized, only: [:my_trips, :my_reservations]
  after_action :verify_policy_scoped, only: [:my_trips, :my_reservations]
  before_action :set_booking, only: [:approve, :decline]

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
    authorize(@booking)

    if @flat.user == current_user
      redirect_to flat_path(@flat), notice: "This flat belongs to you..."
    elsif @booking.save
      redirect_to flat_path(@booking.flat), notice: "Booking successful."
    else
      render 'flats/show'
    end
  end

  def approve
    @booking.status = 'approved'
    @booking.save

    redirect_to my_reservations_path, notice: "Booking approved."
  end

  def decline
    @booking.status = 'declined'
    @booking.save

    redirect_to my_reservations_path, notice: "Booking declined."
  end

  def my_trips
    @bookings = Booking.where(user: current_user)
    policy_scope(@bookings)
  end

  def my_reservations
    @bookings = current_user.reservations.order(status: :asc)
    policy_scope(@bookings)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize(@booking)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
