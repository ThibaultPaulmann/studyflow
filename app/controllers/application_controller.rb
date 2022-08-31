class ApplicationController < ActionController::Base
  before_action :authenticate_user!
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
