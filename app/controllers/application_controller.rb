class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      if request.path.present?
        cookies[:initial_path] = request.path 
      else
        cookies[:initial_path] = root_path
      end
      redirect_to login_path, alert: 'Are you a guru? Verify your email and password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end 

  def logged_in?
     current_user.present?
  end
end
