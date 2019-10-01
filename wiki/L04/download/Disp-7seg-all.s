#-- Encender todos los segmentos del display de 7 segmentos
#-- (incluido el punto)
#-- Bastante con escribir el valor 0xFF en la dirección 0xFFFF0010 

	#--- Direccion donde está mapeado el display derecho
	.eqv DISP_R 0xFFFF0010
	
	#-- Valor a sacar por el puerto del display
	#-- Para encender todos los segmentos debe ser 0xFF
	.eqv VALOR 0xFF
	
	.text
	
	#-- Usamos el regitro x5 como puntero de acceso al puerto
	#-- Cargamos en x5 la direccion de memoria del puerto
	li x5, DISP_R
	
	#-- Cargar el valor a sacar por el Display
	li x6, VALOR
	
	#-- Sacar el valor por el puerto, para que se iluminen
	#-- los segmentos del display
	sw x6, 0(x5)
	
	#-- Ya no hacemos nada mas
	#-- Terminamos con un bucle infinito (porque en el RISC-V de la FPGA
	#-- no hay un Sistema operativo)	
stop:   b stop

	
