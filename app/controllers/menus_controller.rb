class MenusController < ApplicationController
  before_action :set_menu, only: [:edit, :update, :destroy]

  def create
    @menu = Menu.new(menu_params)

    # para comprobar que la tienda pertenece al usuario
    @shop = current_user.shops.find(@menu.shop_id)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to({controller: :admin, action: :index, id: @shop.id}, notice: t('.menu_created_ok')) }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @shop = current_user.shops.find(params[:shop])
    @menu = @shop.menus.new
    @courses = @menu.courses

    respond_to do |format|
      format.html
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to({controller: :admin, action: :index, id: @shop.id}, notice: t('.menu_saved_ok')) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to({controller: :admin, action: :index, id: @shop.id}, notice: t('.menu_destroyed')) }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
      # La siguiente linea fuerzo un find para comprobar que el menu
      # pertenece al usuario actual
      @shop = current_user.shops.find(@menu.shop.id)
    end

    def menu_params
      params.require(:menu).permit(:name, :desserts, :drinks, :bread_included, :id, :shop_id, menukinds_attributes: [:text, :price, :id, :_destroy], courses_attributes: [:name, :text, :id, :_destroy])
    end

end
