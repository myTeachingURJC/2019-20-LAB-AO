#--------------------------------------------------
#-- Subrutina cifrar(pcad1, pcad2, K)
#-- Cifrar la cadena cad1 y almacenarla en cad2
#--
#-- ENTRADA:
#--   a0: Puntero a la cadena origen
#--   a1: Puntero a la cadena destino
#--   a2: Clave
#--
#--  SALIDA:
#--   Ninguna
#------------------------------------------------------

	.globl cifrar

	.text
cifrar:

	#-- Leer el caracter inicial
	lb t0, 0(a0)
	
	#-- Si es igual a '\n' hemos terminado
	li t1, '\n'
	bne t0, t1, cifrar_rec
	
	#-- Almacena en la cadena destino \n
	#-- y finalizarla con el \0
	sb t0, 0(a1)
	sb zero, 1(a1)
	
	#-- Terminar
	b fin
	
cifrar_rec:

	#-- Guardar espacio para la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

	#-- Cifrar el primer caracter
	add t0, t0, a2
	
	#-- Almacenarlo en la cadena destino
	sb t0, 0(a1)

	#-- Apuntar a las subcadenas
	addi a0,a0, 1
	addi a1,a1, 1
	
	#-- Cifrar las subcadenas
	jal cifrar

	#-- Recuperar direccion de retorno
	lw ra, 12(sp)

	#-- Liberar espacio de la pila
	addi sp, sp, 16
	#-- Punto de salida	
fin:			
	ret