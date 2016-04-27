class DwellingsController < ApplicationController
  def index
    @dwellings = Dwelling.all
    @user = current_user
    Match.where(user: @user).delete_all
    @dwellings.each do |dwelling|
      unless dwelling.user.preference.pets != @user.preference.pets
        roomie_score = match_rating(@user, dwelling)
        if roomie_score > 5
          Match.create(user: @user, dwelling: dwelling, score: roomie_score)
        end
      end
    end
    @matches = Match.where(user: @user).order(score: :desc)
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

  def edit
    @states = Dwelling::STATES
    @bedrooms = Dwelling::BEDROOMS
    @bathrooms = Dwelling::BATHROOMS
    @categories = Dwelling::CATEGORIES
    @truefalse = Preference::TRUEFALSE
    @dwelling = Dwelling.find(params[:id])
  end

  def update
    @states = Dwelling::STATES
    @bedrooms = Dwelling::BEDROOMS
    @bathrooms = Dwelling::BATHROOMS
    @categories = Dwelling::CATEGORIES
    @truefalse = Preference::TRUEFALSE
    @dwelling = Dwelling.find(params[:id])
    if @dwelling.update(dwelling_params)
      flash[:notice] = 'Listing was updated successfully'
      redirect_to dwellings_path
    else
      flash[:alert] = @dwelling.errors.full_messages.join('. ')
      render :edit
    end
  end

  def show
    @dwelling = Dwelling.find(params[:id])
    @score = current_user.matches.find_by(dwelling: @dwelling).score
    preferences_array = ["smoking", "drinking", "music", "vegetarian", "cleanliness", "parties", "sports"]
    preferences_array.each do |data|
      if @dwelling.user.preference.send(data) == current_user.preference.send(data)
        instance_variable_set("@#{data}", "green")
      elsif @dwelling.user.preference.send(data) == 0 || current_user.preference.send(data) == 0
      instance_variable_set("@#{data}", "yellow")
      else
        instance_variable_set("@#{data}", "red")
      end
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
