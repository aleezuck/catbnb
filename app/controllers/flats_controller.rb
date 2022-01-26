class FlatsController < ApplicationController
  skip_after_action :verify_authorized, only: [:search]
  after_action :verify_policy_scoped, only: [:search]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = policy_scope(Flat).where(user: current_user)
  end

  def search
    @flats = policy_scope(Flat)

    if params[:query].present?
      @flats = @flats.where('location ILIKE ?', "%#{params[:query]}%")
    end

    if params[:start_date].present? && params[:end_date].present?
      search_flats = []
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @flats.each do |flat|
        found = false
        flat.bookings.each do |booking|
          if (start_date <= booking.start_date && end_date >= booking.start_date) || (start_date <= booking.end_date && end_date >= booking.end_date) || (start_date >= booking.start_date && end_date <= booking.end_date)
            found = true unless booking.status_declined?
            break
          end
        end
        search_flats << flat unless found
      end

      @flats = Flat.where(id: search_flats.map(&:id))
    end

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
    authorize(@flat)
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize(@flat)

    if @flat.save
      redirect_to flats_path, notice: "Flat added successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path, notice: "Flat updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy

    redirect_to flats_path, notice: "Flat deleted."
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize(@flat)
  end

  def flat_params
    params.require(:flat).permit(:title, :location, :price, :description, photos: [])
  end
end
