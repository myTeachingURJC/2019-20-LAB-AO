##-- Programa para realizar los siguientes calculos
##-- var1 = 0xAA
##-- var2 =  (a - b) + c + 5
##-- var3 = var2 + 1

	.data 
	
	#-- Variables
	#-- ESPECIFICACION: Variables en orden
var1:	.word 0xAA  #-- ESPECIFICACION
var2:   .word 0
var3:   .word 0

	.text
	
	#--- Valores iniciales
	#--- a=10; b=20; c=30
	#dds
	#lw x0, 0(x0)
	li x1, 10
	li x2, 20
	li x3, 30
	
	#--- Realizar el cálculo: var2 =  (a - b) + c + 5
	#--                        x10 =  (x1 - x2) + x3 + 5
	sub x10, x1, x2   #-- x10 = x1 - x2
	add x10, x10, x3  #-- x10 = (x1 - x2) + x3
	addi x10,x10,5    #-- X10 = (x1 - x2) + x3 + 5
	
	#-- Almacenar el cálculo en var2
	la x11, var2
	sw x10, 0(x11)  #-- Almacenar var2 = (a - b) + c + 5
	
	#-- Almacenar el cálculo incrementado en var3
	addi x10,x10,1 #-- x10 = var2 + 1
	sw x10, 4(x11) #-- Almacenar var3 = var2 + 1
	
	
	#-- Terminar	
	li a7, 10
	ecall
