class DaysController < ApplicationController
  def add_menu
    menu_id = params[:menu][5..params[:menu].length]
    menu = Menu.find(menu_id)

    # Controlar que el menu sea de una tienda del usuario
    menu.shop.users.find(current_user)

    day = menu.shop.days.find(params[:day])

    if day.menus.where(id: menu.id).empty?
      DaysMenu.create(day_id: day.id, menu_id: menu.id)
    end

    respond_to do |format|
      format.js
    end
  end

  def delete_menu
    menu_id = params[:menu][5..params[:menu].length]
    menu = Menu.find(menu_id)

    # Controlar que el menu sea de una tienda del usuario
    menu.shop.users.find(current_user)

    day = menu.shop.days.find(params[:day])

    #DaysMenu.find_by(day_id: day.id, menu_id: menu.id).delete
    day = Day.find(day.id)
    menu = day.menus.find(menu.id)
    day.menus.delete(menu)

    respond_to do |format|
      format.js { render :add_menu }
    end
  end
end
