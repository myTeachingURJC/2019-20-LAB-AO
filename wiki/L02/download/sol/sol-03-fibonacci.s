#-- Calculo de la serie de fibonacci
#-- La serie se puede ver en el registro x7
#-- x5 y x6 se utilizan para los calculos intermedios
	.text
	
	#-- Valores iniciales, 1, 1
	addi x5, x0, 0
	addi x6, x0, 1

bucle:		
	#-- Calcular siguiente término en t2
	add x7, x5, x6   # x7 = x5 + x6
	
	#-- Actualizar registros
	add x5, x6, x0  #-- x5 = x6
	add x6, x7, zero  #-- x6 = x7
	
	b bucle
	
