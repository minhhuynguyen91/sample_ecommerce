class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_locale

  private
    def set_locale
      I18n.locale = session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end
end
