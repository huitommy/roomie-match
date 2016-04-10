class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
    @dropdown = Preference::DROPDOWN
    @gender = Preference::GENDER
  end

  def create
    @dropdown = Preference::DROPDOWN
    @gender = Preference::GENDER
    @preference = current_user.preferences.build(preference_params)
    if @preference.save
      flash[:notice] = "Profile Created"
      redirect_to dwellings_path
    else
      flash[:alert] = @preference.errors.full_messages.join(". ")
      render :new
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
