# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when 'development'
  user = User.create(email: "esrumor@hotmail.com", password: "publicpass", password_confirmation: "publicpass", confirmed_at: Time.now)

  shop1 = Shop.create(title: "Club social I", manager: "Pepito Pérez", phone: "965665656", email: "clubso1@ua.es", timetable: "horario de apertura")
  shop2 = Shop.create(title: "Don Jamón", manager: "Alvaro Alvarado", phone: "965665657", email: "donjamon@ua.es", timetable: "horario de apertura don jamón")
  shop3 = Shop.create(title: "Cafetería de Ciencias", manager: "Raul Maul", phone: "965665658", email: "ciencias@ua.es", timetable: "horario de apertura ciencias")

  Manage.create(user: user.id, shop: shop2.id)
  Manage.create(user: user.id, shop: shop3.id)
end
