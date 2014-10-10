#encoding: UTF-8
Dado /^el registro de un nuevo usuario$/  do
  #visit "Acceso cafeterías"
  click_link "Acceso cafeterías"
  click_link "Regístrate"
  fill_in "Email", with: "correo@correo.es"
  fill_in "Contraseña", with: "publicas"
  fill_in "Repetir contraseña", with: "publicas"
  click_button "Regístrate"
end

Dado /^su posterior activación por parte del adminsitrador$/ do
  pending # express the regexp above with the code you wish you had
end

Cuando /^se identifica el usuario$/ do
  pending # express the regexp above with the code you wish you had
end

Entonces /^debe aparecer la pantalla de selección de cafetería$/ do
  pending # express the regexp above with the code you wish you had
end
