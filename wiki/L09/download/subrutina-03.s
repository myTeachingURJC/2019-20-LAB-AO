##-- Entendiendo las instrucciones jal/ret

	.include "servicios.asm"

	.text
	
	#-- Salto a la subrutina
	jal subrutina
	
retorno:  #-- Aquí se retorna. Ponemos una etiqueta
          #-- para ver la direccion en la tabla de simbolos
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
#-- PUnto de entrada de la subrutina	
subrutina:

	#-- Punto de salida de la subrutina
	ret