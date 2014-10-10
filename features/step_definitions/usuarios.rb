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

Entonces /^debe aparecer la pantalla de selección de cafetería$/ do
  expect(page).to have_content("Club social I")
  expect(page).to have_content("Don Jamón")
  expect(page).to have_content("Cafetería de Ciencias")
end
