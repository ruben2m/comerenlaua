#language :es
Característica: Funcionamiento de la parte privada,
  de donde entran las cafeterías.

  Escenario: Registro de usuario y selección de tienda.
    Dadas una serie de tiendas predefinidas
    Y el registro de un nuevo usuario
    Y su posterior activación desde el correo electrónico
    Cuando se identifica el usuario
    Entonces debe aparecer la pantalla de selección de cafetería
