Proceso TrabajoPracticoFinal
	
	Definir eleccion, habitacion Como Entero
	Definir estado como logico
	Definir reserva Como Caracter
	Dimension reserva[10,6]//Matriz para guardar los datos de la reserva 
	//(10 SOLAMENTE POR COMODIDAD, CAMBIAR A UN VALOR MAS ALTO YA QUE SON LAS HABITACIONES)
	//tmb hay q validar que al ingresar reservar no pueden ser mayor a 10(En este caso)
	//Datos para cargar: 
	Dimension estado[10]
	
	reserva[0,0] = ("Número de habitación")
	reserva[0,1] = ("Nombre y apellido")
	reserva[0,2] = ("Check In")
	reserva[0,3] = ("Check Out")
	reserva[0,4] = ("Cantidad de huéspedes")
	reserva[0,5] = ("Tipo de habitación")
	
	habitacion = 0
	
	Mientras eleccion <> 5 Hacer
		Escribir "***** SISTEMA DE GESTION DE RESERVAS *****"
        Escribir "1. Ingresar una nueva reserva"
        Escribir "2. Buscar reserva"
        Escribir "3. Ver reservas"
        Escribir "4. Mostrar listado de reservas"
        Escribir "5. Salir"
        Escribir Sin Saltar "Seleccione una opción: "
		Leer eleccion
		
		Segun eleccion Hacer
            1:
                CargarReserva(reserva,habitacion, estado)
				
            2:
                Escribir 'BuscarReserva()'
				//La idea va a ser buscar las reservas realizadas por nombre de cliente, y que muestren los datos de ellas.
            3:
                Escribir 'ordenarReservas()'
				// ordenar por cantidad de huespedes y por nombre y apellido
            4:
				MostrarListado(reserva, estado, habitacion)
				
				// mostrar habitaciones disponibles y ocupadas?
				// mostrar las reservas ordenadas?
				
            5:
                Escribir "Saliendo del sistema..."
            De Otro Modo:
                Escribir "Opción inválida. Intente nuevamente."
        FinSegun
		
	Fin Mientras
	
FinProceso


SubProceso CargarReserva(reserva, habitacion Por Referencia, estado)
	Definir nombre, check_in, check_out, tipo_habitacion Como Caracter
	Definir cant_huespedes Como Entero
	
	habitacion = habitacion + 1
	reserva[habitacion, 0] = ConvertirATexto(habitacion)
	
	
	Escribir ("Ingrese la cantidad de huéspedes")
	Repetir 
		Leer cant_huespedes
		Si cant_huespedes > 2 y cant_huespedes <= 4 Entonces
			tipo_habitacion <- "Habitación doble"
		SiNo
			Si cant_huespedes > 0 y cant_huespedes <= 2 Entonces
				tipo_habitacion <- "Habitación simple"
			SiNo
				Escribir ("No se admite esa cantidad de huéspedes, verifique que la cantidad no sea mayor a 4")
				Escribir ("Intentelo nuevamente")
			FinSi
		FinSi
	Mientras Que cant_huespedes <= 0 o cant_huespedes > 4
	
	Escribir "Ingrese el Nombre y Apellido del titular de la reserva"
	Leer nombre
	reserva[habitacion, 1] <- nombre
	Escribir "Ingrese la fecha de entrada en formato DD/MM/AA"
	Leer check_in
	reserva[habitacion, 2] <- check_in
	Escribir "Ingrese la fecha de salida en formato DD/MM/AA"
	Leer check_out
	reserva[habitacion, 3] <- check_out
	reserva[habitacion, 4] <- ConvertirATexto(cant_huespedes)
	reserva[habitacion, 5] <- tipo_habitacion
	
	estado[habitacion] <- Verdadero
	
	Escribir ("Reserva cargada con éxito")
	Escribir ("A nombre de: "), reserva[habitacion, 1]
	Escribir ("CHECK-IN: "), reserva[habitacion, 2], (" a las 14:00 hs")
	Escribir ("CHECK-OUT: "), reserva[habitacion, 3] (" a las 10:00 hs")
	Escribir ("Cantidad de huéspedes: "), reserva[habitacion, 4]
	Escribir ("Tipo de habitacion: "), reserva[habitacion, 5]
	Escribir ("--------------------")
	
	
FinSubProceso

SubProceso MostrarListado(reserva, estado, habitacion) // Cambiar para segun cantidad de reservas
	
	Definir i, j Como Entero
	
	
	Para i = 1 Hasta habitacion Con Paso 1 Hacer
		
		Escribir reserva[0, 0], (": ") reserva[i, 0]
		Escribir reserva[0, 1], (": ") reserva[i, 1]
		Escribir reserva[0, 2], (": ") reserva[i, 2]
		Escribir reserva[0, 3], (": ") reserva[i, 3]
		Escribir reserva[0, 4], (": ") reserva[i, 4]
		Escribir reserva[0, 5], (": ") reserva[i, 5]
		Si estado[i] = Verdadero Entonces
			
			Escribir "Habitacion ocupada"
			
		FinSi
		Escribir ("-------------------------------------------------------------------------")
		
		
	FinPara

	
	
	
	
FinSubProceso













