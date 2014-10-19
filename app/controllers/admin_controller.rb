#encoding: UTF-8
class AdminController < ApplicationController
  def index
    if current_user.shops.empty?
      # Petición de administración de cafetería
      redirect_to action: "select_shop"
    elsif current_user.shops.count>1 and !check_shop(params[:shop])
      # Seleccionar cafetería a gestionar
      redirect_to action: "choose_shop"
    else
      # Gestion de cafeteria
      if current_user.shops.count==1
        @shop = current_user.shops.first
      else
        @shop = current_user.shops.find(params[:shop])
      end

      @day_names = []
      for i in 1..7 do
        @day_names += [ [I18n.t('date.day_names')[i], i] ]
      end

      # Todos los menus
      @menus = @shop.menus

      # Busco si para hoy hay menu, sino, lo creo
      if params[:day] and params[:day].to_i.in?(1..6)  # solo de lunes a sábado
        day = params[:day].to_i
      else
        day = Date.today.wday
      end
      @day = @shop.days.find_or_create_by(day_of_week: day)


      respond_to do |format|
        format.js
        format.html
      end
    end
  end

  def new_menu
  end

  def modify_menu
  end

  def select_shop
    # TODO mostrar solo las que no administra ya
    @shops = Shop.all
  end

  def choose_shop
    @shops = current_user.shops
  end

  def request_shop
    # Envio email al administrador. Es el administrador quien lo da de alta
    begin
      shop = Shop.find(params[:id])
    rescue => e
      logger.warn "ERROR en el id pasado por parámetro: #{e}"
    end

    if shop
      AdminMailer.send_mail("Petición de gestión de cafetería", "El usuario #{current_user.email} ha solicitado gestionar la cafetería #{shop.id} - #{shop.title}").deliver

      notice = t('.request_shop_sended', shop: shop.title)
    else
      error = t('.request_shop_error')
    end

    redirect_to({ action: "select_shop" }, notice: notice, alert: error)
  end

  protected
    def default_url_options
      { :locale => I18n.locale }
    end

  private
    def check_shop(id)
      !current_user.shops.where(id: id).empty?
    end
end
