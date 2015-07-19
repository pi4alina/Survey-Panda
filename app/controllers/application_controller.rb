class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login, only:[:new]
  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect_to root_path
    end
  end

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end
end
