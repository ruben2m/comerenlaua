#encoding: UTF-8
def address
  "correo@correo.es"
end

Dadas /^una serie de tiendas predefinidas$/ do
  Shop.create(title: "Club social I", manager: "Pepito Pérez", phone: "965665656", email: "clubso1@ua.es", timetable: "horario de apertura")
  Shop.create(title: "Don Jamón", manager: "Alvaro Alvarado", phone: "965665657", email: "donjamon@ua.es", timetable: "horario de apertura don jamón")
  Shop.create(title: "Cafetería de Ciencias", manager: "Raul Maul", phone: "965665658", email: "ciencias@ua.es", timetable: "horario de apertura ciencias")
end

Y /^el registro de un nuevo usuario$/  do
  visit root_path
  click_link "Acceso cafeterías"
  click_link "Regístrate"
  fill_in "Correo electrónico", with: address
  fill_in "Contraseña", with: "publicas"
  fill_in "Repetir contraseña", with: "publicas"
  click_button "Regístrate"
end

Y /^su posterior activación desde el correo electrónico$/ do
  step 'I should receive an email'
  step 'I open the email'
  step 'I should see "Puedes confirmar tu dirección de correo" in the email body'
  step 'I click the first link in the email'
end

Cuando /^se identifica el usuario$/ do
  visit root_path
  click_link "Acceso cafeterías"
  fill_in "Correo electrónico", with: address
  fill_in "Contraseña", with: "publicas"
  click_button "Iniciar sesión"
end

Entonces /^debe aparecer la pantalla de petición de cafetería$/ do
  expect(page).to have_content("Petición de gestión de Cafetería")
  expect(page).to have_content("Club social I")
  expect(page).to have_content("Don Jamón")
  expect(page).to have_content("Cafetería de Ciencias")
end

Cuando /^selecciono la cafetería "(.*?)"$/ do |shop|
  click_link shop
end

Entonces /^envía un correo a "(.*?)"$/ do |correo|
  #TODO step 'I should receive an email'
  expect(page).to have_content("Se ha enviado la petición de gestionar la cafetería")
  expect(page).to have_content("Cafetería de Ciencias")
end

Cuando /^el administrador acepta la gestión con "(.*?)"$/ do |shop|
  s = Shop.where(title: shop).first
  u = User.first # solo hay un usuario
  Manage.create(user_id: u.id, shop_id: s.id)
end

Cuando /^el usuario vuelve a identificarse$/ do
  click_link "Cerrar sesión"
  step "se identifica el usuario"
end

Entonces /^accederá a la cafetería "(.*?)"$/ do |shop|
  expect(page).to have_content("Gestión de menú semanal")
  expect(page).to have_content(shop)
end

Cuando /^accedo a petición de cafetería$/ do
  click_link("Solicitar gestionar otra cafetería")
  step "debe aparecer la pantalla de petición de cafetería"
end

Entonces /^debe aparecer la pantalla de selección de cafetería$/ do
  expect(page).to have_content("Selecciona Cafetería a gestionar")
  expect(page).to have_content("Don Jamón")
  expect(page).to have_content("Cafetería de Ciencias")
end
