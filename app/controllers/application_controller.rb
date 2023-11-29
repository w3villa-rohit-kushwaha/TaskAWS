class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :current_user
  
    private
  
    def current_user
      binding.pry
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end