class MenusController < ApplicationController
  def index
  end

  def create
  end

  def new
    @shop = current_user.shops.find(params[:shop])
    @menu = @shop.menus.new
    @courses = @menu.courses
    # TODO añadir opciones y probar
    respond_to do |format|
      format.html
    end
  end

  def edit
    @menu = Menu.find(params[:menu])
    # La siguiente linea fuerzo un find para comprobar que el menu
    # pertenece al usuario actual
    @shop = current_user.shops.find(@menu.shop.id)
    @courses = @menu.courses
    @menu_kinds = @menu.menukinds

    respond_to do |format|
      format.html
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
end
