
	.text 
	
	.globl exp

# ---------------------------------------------
# - Funcion exp(a, n): Calcula a elevado a n 	
# * ENTRADAS
#   a0: base (>=0)
#   a1: Exponente (>0)
# * SALIDAS:
#   a0: Devuelve el resultado (a elevado a n)
#----------------------------------------------
			
exp:

	#-- Se trata de una funcion intermdia, que llama a otra función
	#-- Por tanto debemos crear la pila para guardar la direcion de retorno
	addi sp, sp, -16
	
	#-- Guardar la direccion de retorno
	sw ra, 12(sp)
	
	#-- El registro s0 lo usamos para almacenar la base
	#-- El registro s1 para el exponenete
	#-- Para NO violar el convenio, tenemos que guardarlos en la pila 
	#-- ya que deben tener su valor original al terminar
	sw s0, 8(sp) 
	sw s1, 4(sp)
	
	#-- El calculo intermedio lo guardamos en s2, por lo que
	#-- hay que preservar s2 primero en la pila
	sw s2, 0(sp)
	
	mv s0, a0  #-- Mover la base a s0
	mv s1, a1  #-- Mover el exponente a s1 
	
	
	#-- El resultado de los calculos intermedios lo guardamos
	#-- en s2, Inicialmente s2 = 1
	li s2, 1
	
	#-- Bucle que realiza el cálculo
bucle:	
		
	# -- Calcular base * s2 (Multiplicar la base por el resultado parcial)
	mv a0, s0 #-- Base
	mv a1, s2 #-- Resultado parcial
	jal mult
	
	#-- El resultado lo guardamos en s2
	mv s2, a0 
	
	#-- Decrementar el exponente (que lo usamos de contador)
	addi s1, s1, -1
	
	#-- Cuando sea 0 hemos terminado
	bgt s1, zero, bucle
	
	
	#-- Hemos terminado
	#-- El resultado se devuelve por a0
	mv a0, s2
	
	#-- Recuperar los registros estáticos de la pila 
	lw s0, 8(sp)
	lw s1, 4(sp)
	lw s2, 0(sp)

        #- Recuperar la direccion de retorno
        lw ra, 12(sp)
        
	# -- Recuperar la pila
	addi sp, sp, 16
	ret
	