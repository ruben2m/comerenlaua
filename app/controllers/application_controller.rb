class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_i18n_locale_from_params
  before_filter :authenticate_user! # skip_before_filter :authenticate_user!

  protected

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          # RMM No muestro error, por si no ponen locale
          #flash.now[:notice] = "#{params[:locale]} traducción no disponible."
          #logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end

end
