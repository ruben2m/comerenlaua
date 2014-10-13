#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when 'development'

  Day.delete_all
  Menukind.delete_all
  Course.delete_all
  Shop.delete_all
  User.delete_all
  Manage.delete_all


  user = User.create(email: "esrumor@hotmail.com", password: "publicpass", password_confirmation: "publicpass", confirmed_at: Time.now)

  shop1 = user.shops.create(title: "Club social I", manager: "Pepito Pérez", phone: "965665656", email: "clubso1@ua.es", timetable: "horario de apertura")
  shop2 = user.shops.create(title: "Don Jamón", manager: "Alvaro Alvarado", phone: "965665657", email: "donjamon@ua.es", timetable: "horario de apertura don jamón")
  shop3 = user.shops.create(title: "Cafetería de Ciencias", manager: "Raul Maul", phone: "965665658", email: "ciencias@ua.es", timetable: "horario de apertura ciencias")

  menu21 = shop2.menus.create(name: 'Menu 1 Jamon',drinks: 'Refresco, agua', desserts: 'Flan, helado', bread_included: true)
  menu22 = shop2.menus.create(name: 'Menu 2 Jamon',drinks: 'Refresco2, agua2', desserts: 'Flan2, helado2', bread_included: false)
  menu23 = shop2.menus.create(name: 'Menu 3 Jamon',drinks: 'Refresco3, agua3', desserts: 'Flan3, helado3', bread_included: true)

  menu21.courses.create(name:'Plato 1',text:'Ensalada,esparragos')
  menu21.courses.create(name:'Plato 2',text:'paella, lentejas')

  menu21.menukinds.create(text:'1º + 2º + postre + bebida + café', price: 6.7)
  menu21.menukinds.create(text:'1º + 2º + bebida', price: 5.2)

  menu21.days.create(day_of_week: 1, shop_id: menu21.shop_id) #lunes

end
