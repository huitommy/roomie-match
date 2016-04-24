class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  PREFERENCES = [
    "smoking",
    "drinking",
    "music",
    "vegetarian",
    "cleanliness",
    "parties",
    "sports"
  ].freeze

  def after_sign_in_path_for(resource)
    if current_user.preference
      dwellings_path
    else
      new_preference_path
    end
  end

  def match_rating(user, dwelling)
    match = 0
    PREFERENCES.each do |data|
      if user.preference.send(data) == dwelling.user.preference.send(data)
        match += 2
      elsif user.preference.send(data) == 0 || dwelling.user.preference.send(data) == 0
        match += 1
      else
        match -= 2
      end
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
