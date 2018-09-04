class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  def extr_locale_in_accept_lang
    locale = params[:locale]#.scan(/^[a-z]{2}/).first
    logger.info "In extr_locale_in_accept_lang: locale = #{locale}"
  end

  private
    #предварительные фильтры
    #подтверждает вход пользователя
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Пожалуйста, авторизуйтесь'
        redirect_to login_url
      end
    end

    #подтверждает наличие административных привелегий
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end





    def set_locale_from_params
      if params[:locale]
        extr_locale_in_accept_lang
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
          logger.info flash.now[:notice]
        else
          flash.now[:alarm] = " #{params[:locale]} Перевод страницы отсутствует"
          logger.error flash.now[:alarm]
        end
        params[:locale]
      end
    end

    def set_locale
      I18n.locale = set_locale_from_params || I18n.default_locale
      Rails.application.routes.default_url_options[:locale]= I18n.locale
    end
end
