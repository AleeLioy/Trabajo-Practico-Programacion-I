Proceso TrabajoPracticoFinal
	Definir eleccion Como Entero
	
	Definir reserva Como Caracter
	Dimension reserva[50,5] //Matriz para guardar los datos de la reserva
	
	//0,1 NOMBRE
	//0.2 CHECK IN
	//0.3 CHECK OUT
	//0.4 ???
	
	Mientras eleccion <> 5 Hacer
		Escribir "***** SISTEMA DE RESERVAS DE HOTEL *****"
        Escribir "1. Cargar reserva"
        Escribir "2. Buscar reserva"
        Escribir "3. Ver reservas"
        Escribir "4. Mostrar listado de reservas"
        Escribir "5. Salir"
        Escribir "Ingrese una opción: "
		
		Leer eleccion
		Segun eleccion Hacer
            1:
                CargarReserva(reserva)
            2:
                Escribir 'BuscarReserva()'
				//La idea va a ser buscar las reservas realizadas por nombre de cliente, y que muestren los datos de ellas.
            3:
                Escribir 'ordenarReservas()'
				// ordenar por fecha de salida? de entrada? Cant_Huespedes?
            4:
				Escribir'MostrarListado()'
				
				// mostrar habitaciones disponibles y ocupadas?
				// mostrar las reservas ordenadas?
				
            5:
                Escribir "Saliendo del sistema..."
            De Otro Modo:
                Escribir "Opción inválida. Intente nuevamente."
        FinSegun
		
	Fin Mientras
	
FinProceso


SubProceso CargarReserva(reserva)
	Definir nombre, check_in, check_out, Tipo_Habitacion Como Caracter
	Definir habitacion, Cant_Huespedes Como Entero
	
	Escribir "Ingrese el Nombre del cliente"
	Leer nombre
	reserva[habitacion, 1] <- nombre
	
	Escribir "Ingrese la fecha de entrada"
	Leer check_in
	reserva[habitacion, 2] <- check_in
	
	Escribir "Ingrese la fecha de salida"
	Leer check_out
	reserva[habitacion, 3] <- check_out
	
	Escribir "Ingrese cantida de Huespedes"
	Leer Cant_Huespedes
	si Cant_Huespedes >= 4 Entonces
		Tipo_Habitacion <- 'HABITACION DOBLE'
	SiNo
		Tipo_Habitacion <- 'HABITACION SIMPLE'
	FinSi
	
	reserva[habitacion, 4] <- Tipo_Habitacion
	
	habitacion <- habitacion + 1
	
	Escribir "Reserva cargada con exito"
	Escribir "A nombre de: ", nombre
	Escribir "CHECK-IN: ", check_in, " Ingreso 10s "
	Escribir "CHECK-OUT: ", check_out, " Egreso 14hs "
	Escribir Tipo_Habitacion
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
FinSubProceso
