#language :es
Característica: Funcionamiento de la parte privada,
  de donde entran las cafeterías.

  Escenario: Registro de usuario y selección de tienda.
    Dadas una serie de tiendas predefinidas
    Y el registro de un nuevo usuario
    Y su posterior activación desde el correo electrónico
    Cuando se identifica el usuario
    Entonces debe aparecer la pantalla de petición de cafetería
    Cuando selecciono la cafetería "Cafetería de Ciencias"
    Entonces envía un correo a "admin@comerenlaua.es"

    Cuando el administrador acepta la gestión con "Cafetería de Ciencias"
    Y el usuario vuelve a identificarse
    Entonces accederá a la cafetería "Cafetería de Ciencias"

    Cuando accedo a petición de cafetería
    Y selecciono la cafetería "Don Jamón"
    Y el administrador acepta la gestión con "Don Jamón"
    Y el usuario vuelve a identificarse
    Entonces debe aparecer la pantalla de selección de cafetería
    Cuando selecciono la cafetería "Don Jamón"
    Entonces accederá a la cafetería "Don Jamón"
