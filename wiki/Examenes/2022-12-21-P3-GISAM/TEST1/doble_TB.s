#----------------------------------------------------------------
#-- Funcion doble(n): Calcula el doble del numero recibido
#-------------------------------
#-- ENTRADAS:
#--    * a0:  Numero a doblar
#-- SALIDAS:
#--    * a0: Numero doble (2 * a0)
#----------------------------------------------------------------

	.include "system.h"
	.include "test.h"

	.globl doble
	
	.text

doble:

	#-- Es una función hoja, por lo que no hay que guardar la direccion
	#-- de retorno en la pila
	add a0, a0, a0

    #-- Modificar todos los registros temporales y de argumentos
	#-- ... salvo a0
	#-- Es para comprobar que no se viola el convenio, y que el 
	#-- programa principal sigue funcionando
	init_temp_regs_noa0
	

	ret
	
