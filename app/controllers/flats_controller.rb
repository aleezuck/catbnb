class FlatsController < ApplicationController
  def index
    @flats = policy_scope(Flat)
  end

  def show
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
  end

  def destroy
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :location, :price, :description)
  end
end
