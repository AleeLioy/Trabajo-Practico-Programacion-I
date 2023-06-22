Proceso TrabajoPracticoFinal
	
	Definir eleccion, habitacion, option, cantidad_habitaciones Como Entero
	Definir estado, validacion Como Logico
	Definir reserva, reserva_aux Como Caracter
	cantidad_habitaciones = 10
	Dimension reserva[10,10]
	Dimension reserva_aux[10,10]
	Dimension estado[10]
	validacion = Verdadero
	
	reserva[0,0] = ("N�mero de habitaci�n")
	reserva[0,1] = ("Nombre y apellido")
	reserva[0,2] = ("Check In")
	//reserva[0,3] = ("Mes")
	//reserva[0,4] = ("A�o")
	reserva[0,5] = ("Check Out")
	//reserva[0,6] = ("Mes")
	//reserva[0,7] = ("A�o")
	reserva[0,8] = ("Cantidad de hu�spedes")
	reserva[0,9] = ("Tipo de habitaci�n")
	
	habitacion = 0
	
	Mientras eleccion <> 5 Hacer
		Escribir "***** SISTEMA DE GESTION DE RESERVAS *****"
        Escribir "1. Ingresar una nueva reserva"
        Escribir "2. Buscar reserva"
        Escribir "3. Ordenar reservas"
        Escribir "4. Mostrar listado de reservas"
        Escribir "5. Salir"
        Escribir Sin Saltar "Seleccione una opci�n: "
		Leer eleccion
		
		Segun eleccion Hacer
            1:
				validacion = Falso
				CargarReserva(reserva,reserva_aux,habitacion, estado, cantidad_habitaciones)
				
            2:
				Si validacion = Verdadero Entonces
					Escribir ("No hay reservas ingresadas. Primero debe ingresar una reserva")
				SiNo
					BuscarReserva(reserva, estado, habitacion)
				FinSi
            3:
				Si validacion = Verdadero Entonces
					Escribir ("No hay reservas ingresadas. Primero debe ingresar una reserva")
				SiNo
					Escribir ("1. Ordenar por Nombre")
					Escribir ("2 .Ordenar por Check In")
					Leer option
					Segun option Hacer
						1:
							OrdenarNombre(reserva_aux, reserva, habitacion)
							
						2:
							OrdenarReservas(reserva, estado, habitacion)
							
					FinSegun
				FinSi
				
            4:
				Si validacion = Verdadero Entonces
					Escribir ("No hay reservas ingresadas. Primero debe ingresar una reserva")
				SiNo
					MostrarListado(reserva, estado, habitacion)
				FinSi
				
            5:
                Escribir "Saliendo del sistema..."
            De Otro Modo:
                Escribir "Opci�n inv�lida. Intente nuevamente."
        FinSegun
		
	Fin Mientras
	
FinProceso


SubProceso CargarReserva(reserva,reserva_aux,habitacion Por Referencia, estado, cantidad_habitaciones Por Referencia)
	
	Definir nombre, dia_check_in, mes_check_in, ano_check_in, dia_check_out, mes_check_out, ano_check_out, tipo_habitacion Como Caracter
	Definir cant_huespedes Como Entero
	
	validacion = Falso
	habitacion = habitacion + 1
	reserva[habitacion, 0] = ConvertirATexto(habitacion)
	reserva_aux[habitacion, 0] = ConvertirATexto(habitacion)
	Si cantidad_habitaciones == 0 Entonces
		Escribir ("No hay m�s habitaciones disponibles")
	SiNo
		Escribir ("Quedan disponibles "), cantidad_habitaciones, (" habitaciones") // validar que sean mayor a 0 y si es 0 no te permita cargar reservas
		Escribir ("Ingrese la cantidad de hu�spedes")
		Repetir 
			Leer cant_huespedes
			Si cant_huespedes > 2 y cant_huespedes <= 4 Entonces
				tipo_habitacion <- "Habitaci�n doble"
			SiNo
				Si cant_huespedes > 0 y cant_huespedes <= 2 Entonces
					tipo_habitacion <- "Habitaci�n simple"
				SiNo
					Escribir ("No se admite esa cantidad de hu�spedes, verifique que la cantidad no sea mayor a 4")
					Escribir ("Intentelo nuevamente")
				FinSi
			FinSi
		Mientras Que cant_huespedes <= 0 o cant_huespedes > 4
		
		Escribir "Ingrese el Nombre y Apellido del titular de la reserva"
		Leer nombre
		reserva[habitacion, 1] <- nombre
		reserva_aux[habitacion, 1] <- nombre
		Escribir "Ingrese la fecha de entrada: "
		Escribir "Dia (DD):"
		Leer dia_check_in
		Escribir "Mes (MM):"
		Leer mes_check_in
		Escribir "A�o (AA):"
		Leer ano_check_in
		reserva[habitacion, 2] <- dia_check_in
		reserva[habitacion, 3] <- mes_check_in
		reserva[habitacion, 4] <- ano_check_in
		reserva_aux[habitacion, 2] <- dia_check_in
		reserva_aux[habitacion, 3] <- mes_check_in
		reserva_aux[habitacion, 4] <- ano_check_in
		Escribir "Ingrese la fecha de salida"
		Escribir "Dia (DD):"
		Leer dia_check_out
		Escribir "Mes (MM):"
		Leer mes_check_out
		Escribir "A�o (AA):"
		Leer ano_check_out
		reserva[habitacion, 5] <- dia_check_out
		reserva[habitacion, 6] <- mes_check_out
		reserva[habitacion, 7] <- ano_check_out
		reserva[habitacion, 8] <- ConvertirATexto(cant_huespedes)
		reserva[habitacion, 9] <- tipo_habitacion
		//pasar todo esto a subproceso
		reserva_aux[habitacion, 5] <- dia_check_out
		reserva_aux[habitacion, 6] <- mes_check_out
		reserva_aux[habitacion, 7] <- ano_check_out
		reserva_aux[habitacion, 8] <- ConvertirATexto(cant_huespedes)
		reserva_aux[habitacion, 9] <- tipo_habitacion
		
		estado[habitacion] <- Verdadero
		cantidad_habitaciones = cantidad_habitaciones - 1
		
		Escribir ("Reserva cargada con �xito")
		Escribir ("A nombre de: "), reserva[habitacion, 1]
		Escribir ("CHECK-IN: "), reserva[habitacion, 2], "/", reserva[habitacion, 3], "/", reserva[habitacion, 4], (" a las 14:00 hs")
		Escribir ("CHECK-OUT: "), reserva[habitacion, 5], "/", reserva[habitacion, 6], "/", reserva[habitacion, 7], (" a las 10:00 hs")
		Escribir ("Cantidad de hu�spedes: "), reserva[habitacion, 8]
		Escribir ("Tipo de habitaci�n: "), reserva[habitacion, 9]
		Escribir ("--------------------")
	FinSi
	
	
FinSubProceso

SubProceso BuscarReserva(reserva, estado, habitacion Por Referencia)
	
	Definir nombre Como Caracter
	Definir i Como Entero
	Definir validacion Como Logico
	validacion = Falso
	Mostrar "Ingrese el nombre del cliente a buscar: "
	Leer nombre
	nombre = Mayusculas(nombre)
	
	Para i <- 1 Hasta habitacion Con Paso 1 Hacer
		Si Mayusculas(reserva[i, 1]) = nombre Entonces
			Mostrar "Resultados de la b�squeda:"
			Escribir "Cliente: ", reserva[i, 1]
			Escribir "Fecha de check-in: ", reserva[i, 2], "/", reserva[i, 3], "/", reserva[i, 4]
			Escribir "Fecha de check-out: ", reserva[i, 5],"/", reserva[i, 6], "/", reserva[i, 7] 
			Escribir "Tipo de habitaci�n: ", reserva[i, 8]
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
	Para i <- 1 Hasta habitacion Con Paso 1 Hacer
		aux1 <- i
		Para j <- i + 1 Hasta habitacion Con Paso 1 Hacer
			Si reserva[j, 4] < reserva[i, 4] o reserva[j, 4] = reserva[i, 4] Entonces
				Si reserva[j, 3] < reserva[i, 3] o reserva[j, 3] = reserva[i, 3] Entonces
					Si reserva[j, 2] < reserva[i, 2] Entonces
						aux1 = j
					FinSi
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

SubProceso MostrarListado(reserva, estado, habitacion)
	
	Definir i, j Como Entero	
	Para i = 1 Hasta 9 Con Paso 1 Hacer
		Si estado[i] = Verdadero Entonces
			Escribir reserva[0, 0], (": "), i,  " -Habitacion ocupada-"
			Escribir reserva[0, 1], (": ") reserva[i, 1]
			Escribir reserva[0, 2], (": ") reserva[i, 2], ("/"), reserva[i, 3], ("/"), reserva[i, 4]
			Escribir reserva[0, 5], (": ") reserva[i, 5], ("/"), reserva[i, 6], ("/"), reserva[i, 7]
			Escribir reserva[0, 8], (": ") reserva[i, 8]
			Escribir reserva[0, 9], (": ") reserva[i, 9]
		SiNo
			Escribir reserva[0, 0], (": "), i,  " -Habitacion disponible-"
		FinSi
		Escribir ("-------------------------------------------------------------------------")
	FinPara
	
FinSubProceso

SubProceso OrdenarNombre(reserva_aux, reserva, habitacion) // ordenar por numero de hab y cant de huespedes
	
	Definir i,j Como Entero
	Definir nombre_aux Como Caracter
	Para i = 1 Hasta habitacion Con Paso 1 Hacer
        Para j = i+1 Hasta habitacion Con Paso 1 Hacer
            Si reserva_aux[i,1] > reserva_aux[j,1] Entonces
				nombre_aux = reserva_aux[i,1]
				reserva_aux[i,1] = reserva_aux[j,1]
				reserva_aux[j,1] = nombre_aux
            FinSi
        FinPara
    FinPara
	Escribir ("Orden alfabetico por Nombre de los huespedes: ") 
	
	Para i = 1 Hasta habitacion Con Paso 1 Hacer
		Escribir reserva[0, 0], (": ") reserva_aux[i, 0]
		Escribir reserva[0, 1], (": ") reserva_aux[i, 1]
		Escribir reserva[0, 2], (": ") reserva_aux[i, 2], "/", reserva_aux[i, 3], "/", reserva_aux[i, 4]
		Escribir reserva[0, 5], (": ") reserva_aux[i, 5], "/", reserva_aux[i, 6], "/", reserva_aux[i, 7]
		Escribir reserva[0, 8], (": ") reserva_aux[i, 8]
		Escribir reserva[0, 9], (": ") reserva_aux[i, 9]
		Escribir ("-------------------------------------------------------------------------")
	FinPara
	
FinSubProceso