#language :es
Característica: Funcionamiento de la parte privada,
  de donde entran las cafeterías.

  Escenario: Registro de usuario y selección de tienda.
    Dado el registro de un nuevo usuario
    Y su posterior activación por parte del adminsitrador
    Cuando se identifica el usuario
    Entonces debe aparecer la pantalla de selección de cafetería
