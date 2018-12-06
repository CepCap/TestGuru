class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:initial_path]
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
