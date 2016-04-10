class DwellingsController < ApplicationController
  def index
    @dwellings = Dwelling.all
  end

  def new
    @dwelling = Dwelling.new
  end

  def create
    @dwelling = Dwelling.new(dwelling_params)
    if @dwelling.save
      flash[:notice] = "Listing Added"
      redirect_to dwellings_path
    else
      flash[:alert] = @dwelling.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def dwelling_params
    params.require(:dwelling).permit(
      :address,
      :city,
      :state,
      :zip_code,
      :category,
      :bedrooms,
      :bathrooms,
      :sq_ft,
      :rent,
      :parking
    )
  end
end
