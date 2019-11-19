#---------------------------------------------------
#-- Subrutina maximo(pdata)
#-- Calcular el maximo de un conjuto de datos almacenados definidos por su puntero
#-- El valor maximo se calcula de forma recursiva
#-- 
#-- ENTRADAS:
#--   a0:  Puntero a los datos
#-- SALIDAS:
#--   a0: Valor maximo de esos datos
#-------------------------------------------------------------------------

	#-- Punto de entrada
	.globl maximo

	.text 
maximo:	

	#-- Leer el primer byte y comprobar si es el ultimo
	lb t0, 0(a0)
	
	#-- Comprobar si es el ultimo byte
	bne t0,zero, maximo_rec
	
	#-- Si no hay mas elementos, devolver 0
	li a0, 0
	b fin
	
maximo_rec:

	#-- Crear la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

	#-- Guardar primer byte en la pila
	sw t0, 0(sp)
	
	#-- Calcular el maximo del resto de valores
	addi a0, a0, 1
	
	jal maximo
	
	#-- Recuperar el valor maximo
	lw t0, 0(sp)
	
	#-- Calcular el maximo entre a0 y t0
	bgt a0, t0, op1_max
	
	#-- El valor maximo es t0
	#-- Lo llevamos a a0 para devolverlo
	mv a0, t0
	
op1_max:
	#-- El valor maximo esta en a0

	#--- Recueprar direccion de retorno
	lw ra, 12(sp)

	#-- Liberar espacio de la pila
	addi sp, sp, 16
	
	#--- Punto de salida
fin:
	ret