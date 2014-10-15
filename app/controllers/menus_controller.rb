class MenusController < ApplicationController
  before_action :set_menu, only: [:edit, :update, :destroy]

  def index
  end

  def create
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

  def show
  end

  #Processing by MenusController#update as HTML
  #Parameters: {"utf8"=>"✓", "authenticity_token"=>"SOOJRMMazkS6laSWUZ8hxEKTknHoMZY+TDigObAfzNk=", "menu"=>{"name"=>"Menu 1 Jamon", "courses_attributes"=>{"0"=>{"name"=>"Plato 1", "text"=>"Ensalada,esparragos", "id"=>"1"}, "1"=>{"name"=>"Plato 2", "text"=>"paella, lentejas", "id"=>"2"}}, "desserts"=>"Flan, helado", "drinks"=>"Refresco, agua", "bread_included"=>"1", "menukinds_attributes"=>{"0"=>{"text"=>"1º + 2º + postre + bebida + café", "price"=>"6.7", "id"=>"1"}, "1"=>{"text"=>"1º + 2º + bebida", "price"=>"5.2", "id"=>"2"}}}, "button"=>"", "locale"=>"es", "id"=>"1"}
  #User Load (0.3ms)  SELECT  "users".* FROM "users"  WHERE "users"."id" = 1  ORDER BY "users"."id" ASC LIMIT 1

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to model: :admin, action: :index, id: @shop.id, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
      # La siguiente linea fuerzo un find para comprobar que el menu
      # pertenece al usuario actual
      @shop = current_user.shops.find(@menu.shop.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :courses_attributes, :desserts, :drinks, :bread_included, :menukinds_attributes, :id)
    end

end
