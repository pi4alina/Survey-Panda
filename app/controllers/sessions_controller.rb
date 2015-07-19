class SessionsController < ApplicationController

  def new
    if request.xhr? 
      render partial: 'new', layout: false
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      redirect_to surveys_path
    else
      render 'error'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
