#-- Algoritmo a implementar
#def len(cad):
#  if cad=="":
#    return 0
#  else:
#    return 1 + len(cad[1:])


	.globl len
	
	.text

	# def len(cad):	
len:
	#--- En a0 recibimos el puntero a la cadena
	
	#------- if cad == ""
	
	#-- Para determinar si estamos en el final de la cadena hay que
	#-- leer el primer caracter de la cadena
	lb t0, 0(a0)  
	
	#-- Si es \0 terminamos
	beq t0, zero, ret_0
	
	#-- Else:
	
	#-- En esta parte vamos a llamar a otra función, por lo que hay que crear la pila
	#-- y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-------- Realizar la llamada a len(cad[1:])
	#-- La subcadena cad[1:] se obtiene incrementado a0 en 1, 
	#-- para apuntar al siguiente byte
	addi a0, a0,1
	jal len
	
	#-- En a0 tenemos la longitud de la subcadnea:  a0 = len(cad[1:])
	#-- Ahora hay que sumarle 1, y retornar el valor 1 + len(cad[1:])
	addi a0, a0, 1
	
	#-- Al llegar a ret se devolverra 
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	addi sp, sp, 16
	b fin
	
	#-- return 0
ret_0:  li a0, 0
    
        #-- Terminar    
fin:

	ret