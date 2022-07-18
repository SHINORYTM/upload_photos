require 'net/http'

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def check_authenticate
    return if current_user

    redirect_to controller: :sessions, action: :new
  end
end
