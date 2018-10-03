class SetLanguageController < ApplicationController
  def en
    I18n.locale = :en
    set_locale_exit
  end

  def vi
    I18n.locale = :vi
    set_locale_exit
  end

  private
    def set_locale_exit
      session[:locale] = I18n.locale
      redirect_to root_path
    end
end
