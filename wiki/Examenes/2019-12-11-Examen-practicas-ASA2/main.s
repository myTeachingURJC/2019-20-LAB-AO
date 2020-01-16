#----- PROGRAMA PRINCIPAL

         #-- Servicios del sistema operativo
         .eqv EXIT          10
         .eqv PRINT_STRING  4
         .eqv READ_STRING   8
         .eqv MAX 100
    
         .data
msg1:    .string "\n\nIntroduce cadena: "        
cad:     .space MAX
        
    .text

    #-- Repetir el bucle hasta que se introduzca la cadena nula "\n"
    #-- (Pulsar enter sin introducir nada)
    
bucle:        
    #-- Imprimir mensaje 1
    la a0, msg1
    li a7, PRINT_STRING
    ecall 
    
    #-- Pedir cadena al usuario
    la a0, cad
    li a1, MAX
    li a7, READ_STRING
    ecall
    
    #-- Si el primer caracter es '\n' terminar
    lb t0, 0(a0)
    li t1, '\n'
    beq t0, t1, fin 
    
    #-- Llamar a la funcion de procesar
    la a0, cad
    jal procesar
            
    #-- Repetir
    b bucle
    
fin:    
    
    #--- Terminar
    li a7, EXIT
    ecall
    
    
