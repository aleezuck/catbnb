class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = policy_scope(Flat)
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
