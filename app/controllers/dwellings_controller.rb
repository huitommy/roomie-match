class DwellingsController < ApplicationController
  def index
    @dwellings = Dwelling.all
  end

  def new
    @dwelling = Dwelling.new
    @states = Dwelling::STATES
    @bedrooms = Dwelling::BEDROOMS
    @bathrooms = Dwelling::BATHROOMS
    @categories = Dwelling::CATEGORIES
    @truefalse = Preference::TRUEFALSE
  end

  def create
    @states = Dwelling::STATES
    @bedrooms = Dwelling::BEDROOMS
    @bathrooms = Dwelling::BATHROOMS
    @categories = Dwelling::CATEGORIES
    @truefalse = Preference::TRUEFALSE
    @dwelling = current_user.create_dwelling(dwelling_params)
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
      :parking,
      :user_id
    )
  end
end
