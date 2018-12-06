class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:id].nil?
        redirect_to controller: cookies[:controller], action: cookies[:action]
      else
        redirect_to controller: cookies[:controller], action: cookies[:action], id: cookies[:id]
      end
    else
      render :new
    end
  end

  def destroy
    reset_session
    cookies.delete :current_user
    redirect_to login_path
  end

end
