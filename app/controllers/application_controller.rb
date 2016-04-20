class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.preference
      dwellings_path
    else
      new_preference_path
    end
  end

  def match_rating(user, dwelling)
    match = 0
    if user.preference.smoking == dwelling.user.preference.smoking
      match += 2
    elsif user.preference.smoking == 0 || dwelling.user.preference.smoking == 0
      match += 1
    else
      match -= 2
    end
    if user.preference.drinking == dwelling.user.preference.drinking
      match += 2
    elsif user.preference.drinking == 0 || dwelling.user.preference.drinking == 0
      match += 1
    else
      match -= 2
    end
    if user.preference.music == dwelling.user.preference.music
      match += 2
    elsif user.preference.music == 0 || dwelling.user.preference.music == 0
      match += 1
    else
      match -= 2
    end
    if user.preference.vegetarian == dwelling.user.preference.vegetarian
      match += 2
    elsif user.preference.vegetarian == 0 || dwelling.user.preference.vegetarian == 0
      match += 1
    else
      match -= 2
    end
    if user.preference.cleanliness == dwelling.user.preference.cleanliness
      match += 2
    elsif user.preference.cleanliness == 0 || dwelling.user.preference.cleanliness == 0
      match += 1
    else
      match -= 2
    end
    if user.preference.parties == dwelling.user.preference.parties
      match += 2
    elsif user.preference.parties == 0 || dwelling.user.preference.parties == 0
      match += 1
    else
      match -= 2
    end
    if user.preference.sports == dwelling.user.preference.sports
      match += 2
    elsif user.preference.sports == 0 || dwelling.user.preference.sports == 0
      match += 1
    else
      match -= 2
    end
    match
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
