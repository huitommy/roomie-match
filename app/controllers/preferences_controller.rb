class PreferencesController < ApplicationController
  def new
    if !current_user.preference.nil?
      flash[:notice] = "Profile Already Created"
      redirect_to dwellings_path
    end
    @preference = Preference.new
    @dropdown = Preference::DROPDOWN
    @gender = Preference::GENDER
  end

  def create
    @dropdown = Preference::DROPDOWN
    @gender = Preference::GENDER
    @preference = current_user.create_preference(preference_params)
    if @preference.save
      flash[:notice] = "Profile Created"
      redirect_to dwellings_path
    else
      flash[:alert] = @preference.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @dropdown = Preference::DROPDOWN
    @gender = Preference::GENDER
    @preference = Preference.find(params[:id])
  end

  def update
    @dropdown = Preference::DROPDOWN
    @gender = Preference::GENDER
    @preference = Preference.find(params[:id])
    if @preference.update(preference_params)
      flash[:notice] = 'Preference was updated successfully'
      redirect_to dwellings_path
    else
      flash[:alert] = @preference.errors.full_messages.join('. ')
      render :edit
    end
  end

  private

  def preference_params
    params.require(:preference).permit(
      :pets,
      :smoking,
      :drinking,
      :music,
      :vegetarian,
      :cleanliness,
      :parties,
      :sports,
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :user_id,
      :dwelling_id
    )
  end
end
