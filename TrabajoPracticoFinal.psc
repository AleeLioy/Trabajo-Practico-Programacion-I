Proceso TrabajoPracticoFinal
	Definir eleccion Como Entero
	
	Mientras eleccion <> 5 Hacer
		Escribir "***** SISTEMA DE RESERVAS DE HOTEL *****"
        Escribir "1. Cargar reserva"
        Escribir "2. Buscar reserva"
        Escribir "3. Ver reservas"
        Escribir "4. Mostrar listado de reservas"
        Escribir "5. Salir"
        Escribir "Ingrese una opci�n: "
		
		Leer eleccion
		Segun eleccion Hacer
            1:
                Escribir 'CargarReserva()'
            2:
                Escribir 'BuscarReserva()'
            3:
                Escribir 'VerReservas()'
            4:
				Escribir'MostrarListado()'
            5:
                Escribir "Saliendo del sistema..."
            De Otro Modo:
                Escribir "Opci�n inv�lida. Intente nuevamente."
        FinSegun
		
	Fin Mientras
	
FinProceso

