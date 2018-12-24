class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(resource)
    if resource.is_a? Admin
      admin_tests_path
    else
      super
    end
  end

  def default_url_options
    { lang = I18n.locale } unless I18n.locale == I18n.default_locale
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale 
  end

end
