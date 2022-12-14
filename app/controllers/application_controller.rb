class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :photo])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :photo])
  end

  before_action :set_time_zone, if: :user_signed_in?

  # def set_current_user
  #   if session[:user_id]
  #     Current.user = User.find(id: session[:user_id])
  #   end
  # end

  private

  def set_time_zone
    Time.zone = user_session[:time_zone]
  end
end
