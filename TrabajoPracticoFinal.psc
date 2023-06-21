Proceso TrabajoPracticoFinal
	
	Definir eleccion, habitacion Como Entero
	Definir estado como logico
	Definir reserva Como Caracter
	Dimension reserva[10,10]//Matriz para guardar los datos de la reserva 
	//(10 SOLAMENTE POR COMODIDAD, CAMBIAR A UN VALOR MAS ALTO YA QUE SON LAS HABITACIONES)
	//tmb hay q validar que al ingresar reservar no pueden ser mayor a 10(En este caso)
	//Datos para cargar: 
	Dimension estado[10]
	
	reserva[0,0] = ("Número de habitación")
	reserva[0,1] = ("Nombre y apellido")
	reserva[0,2] = ("Check In")
	reserva[0,5] = ("Check Out")
	reserva[0,8] = ("Cantidad de huéspedes")
	reserva[0,9] = ("Tipo de habitación")
	
	habitacion = 0
	
	Mientras eleccion <> 5 Hacer
		Escribir "***** SISTEMA DE GESTION DE RESERVAS *****"
        Escribir "1. Ingresar una nueva reserva"
        Escribir "2. Buscar reserva"
        Escribir "3. Ordenar reservas"
        Escribir "4. Mostrar listado de reservas"
        Escribir "5. Salir"
        Escribir Sin Saltar "Seleccione una opción: "
		Leer eleccion
		
		Segun eleccion Hacer
            1:
                CargarReserva(reserva,habitacion, estado)
				
            2:
                BuscarReserva(reserva, estado, habitacion)
				//La idea va a ser buscar las reservas realizadas por nombre de cliente, y que muestren los datos de ellas.
            3:
				Escribir ("1. Ordenar por Nombre")
				Escribir ("2 .Ordenar por Check In")
				Leer option
				Segun option Hacer
					1:
						OrdenarNombre(reserva, habitacion)
						
					2:
						OrdenarReservas(reserva, estado, habitacion)
						
				FinSegun
				
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
	
	Definir nombre, dia_check_in, mes_check_in, ano_check_in, dia_check_out, mes_check_out, ano_check_out, tipo_habitacion Como Caracter
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
	Escribir "Ingrese la fecha de entrada: "
	Escribir "Dia (DD):"
	Leer dia_check_in
	Escribir "Mes (MM):"
	Leer mes_check_in
	Escribir "Año (AA):"
	Leer ano_check_in
	reserva[habitacion, 2] <- dia_check_in
	reserva[habitacion, 3] <- mes_check_in
	reserva[habitacion, 4] <- ano_check_in
	Escribir "Ingrese la fecha de salida"
	Escribir "Dia (DD):"
	Leer dia_check_out
	Escribir "Mes (MM):"
	Leer mes_check_out
	Escribir "Año (AA):"
	Leer ano_check_out
	reserva[habitacion, 5] <- dia_check_out
	reserva[habitacion, 6] <- mes_check_out
	reserva[habitacion, 7] <- ano_check_out
	reserva[habitacion, 8] <- ConvertirATexto(cant_huespedes)
	reserva[habitacion, 9] <- tipo_habitacion
	
	estado[habitacion] <- Verdadero
	
	Escribir ("Reserva cargada con éxito")
	Escribir ("A nombre de: "), reserva[habitacion, 1]
	Escribir ("CHECK-IN: "), reserva[habitacion, 2], "/", reserva[habitacion, 3], "/", reserva[habitacion, 4], (" a las 14:00 hs")
	Escribir ("CHECK-OUT: "), reserva[habitacion, 5], "/", reserva[habitacion, 6], "/", reserva[habitacion, 7], (" a las 10:00 hs")
	Escribir ("Cantidad de huéspedes: "), reserva[habitacion, 8]
	Escribir ("Tipo de habitacion: "), reserva[habitacion, 9]
	Escribir ("--------------------")
	
FinSubProceso

SubProceso BuscarReserva(reserva, estado, habitacion Por Referencia)
	
	Definir nombre Como Caracter
	Definir i Como Entero
	Definir validacion Como Logico
	validacion = Falso
	Mostrar "Ingrese el nombre del cliente a buscar: "
	Leer nombre
	
	Para i <- 1 Hasta habitacion Con Paso 1 Hacer
		Si reserva[i, 1] = nombre Entonces
			Mostrar "Resultados de la búsqueda:"
			Escribir "Cliente: ", reserva[i, 1]
			Escribir "Fecha de check-in: ", reserva[i, 2], "/", reserva[i, 3], "/", reserva[i, 4]
			Escribir "Fecha de check-out: ", reserva[i, 5],"/", reserva[i, 6], "/", reserva[i, 7] 
			Escribir "Tipo de habitación: ", reserva[i, 8]
			Escribir "-----------------------------"
			validacion = Verdadero
		FinSi
	FinPara
	
	Si validacion = Falso Entonces
		Escribir ("Cliente no encontrado")
	FinSi
	
	
FinSubProceso


SubProceso OrdenarReservas(reserva, estado, habitacion Por Referencia)
	
	Definir i, j, aux1 Como Entero
	Definir nombreAux, aux2, aux3, aux4 Como caracter
	Para i <- 1 Hasta habitacion Con Paso 1 Hacer //habitacion es un contador creo q no hace falta el -1
		aux1 <- i
		Para j <- i + 1 Hasta habitacion Con Paso 1 Hacer
			Si reserva[j, 3] < reserva[i, 3] o reserva[j, 3] = reserva[i, 3] Entonces
				Si reserva[j, 2] < reserva[i, 2] Entonces
					aux1 = j
				FinSi
			FinSi
			
			Aux2 = reserva[i, 2]
			Aux3 = reserva[i, 3]
			Aux4 = reserva[i, 4]
			reserva[i, 2] = reserva[j, 2]
			reserva[i, 3] = reserva[j, 3]
			reserva[i, 4] = reserva[j, 4]
			reserva[j, 2] = aux2
			reserva[j, 3] = aux3
			reserva[j, 4] = aux4
			
			nombreAux = reserva[i,1]
			reserva[i,1] = reserva[j, 1]
			reserva[j, 1] = nombreAux
			
		FinPara
	FinPara
	Escribir "Las reservas han sido ordenadas por fecha de check-in."
	Para i <- 1 hasta habitacion Con Paso 1 Hacer
		Escribir "Reserva a nombre de ",reserva[i, 1], ", con fecha de ingreso el ", reserva[i,2], "/", reserva[i, 3], "/", reserva[i, 4]
	FinPara
	Escribir ("-------------------------------------------------------------------------")
	
FinSubProceso

SubProceso MostrarListado(reserva, estado, habitacion) // Cambiar para segun cantidad de reservas
	
	Definir i, j Como Entero	
	Para i = 1 Hasta 9 Con Paso 1 Hacer
		Si estado[i] = Verdadero Entonces
			Escribir reserva[0, 0], (": "), i,  " -Habitacion ocupada-"
			Escribir reserva[0, 1], (": ") reserva[i, 1]
			Escribir reserva[0, 2], (": ") reserva[i, 2], ("/"), reserva[i, 3], ("/"), reserva[i, 4]
			Escribir reserva[0, 5], (": ") reserva[i, 5], , ("/"), reserva[i, 6], ("/"), reserva[i, 7]
			Escribir reserva[0, 8], (": ") reserva[i, 8]
			Escribir reserva[0, 9], (": ") reserva[i, 9]
		SiNo
			Escribir reserva[0, 0], (": "), i,  " -Habitacion disponible-"
		FinSi
		Escribir ("-------------------------------------------------------------------------")
	FinPara
	
FinSubProceso

SubProceso OrdenarNombre(reserva, habitacion)
	
	Definir i,j Como Entero
	Definir nombre_aux Como Caracter
	Para i = 1 Hasta habitacion Con Paso 1 Hacer
        Para j = i+1 Hasta habitacion Con Paso 1 Hacer
            Si reserva[i,1] > reserva[j,1] Entonces
				nombre_aux = reserva[i,1]
				reserva[i,1] = reserva[j,1]
				reserva[j,1] = nombre_aux
            FinSi
        FinPara
    FinPara
	Escribir ("Orden alfabetico por Nombre de los huespedes: ") 
	Para i = 1 Hasta habitacion Con Paso 1 Hacer
		Escribir  reserva[i,1]
	FinPara
	Para i = 1 Hasta habitacion Con Paso 1 Hacer
		Escribir reserva[0, 0], (": ") reserva[i, 0]
		Escribir reserva[0, 1], (": ") reserva[i, 1]
		Escribir reserva[0, 2], (": ") reserva[i, 2], "/", reserva[i, 3], "/", reserva[i, 4]
		Escribir reserva[0, 3], (": ") reserva[i, 5], "/", reserva[i, 6], "/", reserva[i, 7]
		Escribir reserva[0, 4], (": ") reserva[i, 8]
		Escribir reserva[0, 5], (": ") reserva[i, 9]
		Escribir ("-------------------------------------------------------------------------")
	FinPara
	
FinSubProceso