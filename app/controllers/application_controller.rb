class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      return nil
    end
  end
  helper_method :current_user
end
