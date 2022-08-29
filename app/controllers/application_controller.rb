class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # def set_current_user
  #   if session[:user_id]
  #     Current.user = User.find(id: session[:user_id])
  #   end
  # end
end
