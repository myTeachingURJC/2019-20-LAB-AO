#-- Ejemplo de lectura de medias
#-- palabras


	#-- Código de los servivios del S.O
	.eqv EXIT 10

	.data

datos:		
	.half 0xCAFE
	.half 0xBACA
	.half 0xCACA
	
	.text
	
	
	#-- Usamos le puntero t0 para acceder a las
	#-- medias palabras
	la t0, datos
	
	#-- En t1 se mete la primera media-palabra
	lh t1, 0(t0)
	
	#-- En t2 se mete la segunda media-palabra
	lh t2, 2(t0)
	
	#-- En t3 se mete la tercera media-palabra
	lh t3, 4(t0)
	
	#-- Terminar
	li a7, EXIT
	ecall