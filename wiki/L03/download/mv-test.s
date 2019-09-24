#-- Probando la pseudoinstrucción mv

	.text
	
	#-- Cargar el valor 30 en x5
	li x5, 30
	
	#-- Llevar el valor del registro x5 al x10
	mv x10, x5
	
	#-- Terminar
	li a7, 10
	ecall