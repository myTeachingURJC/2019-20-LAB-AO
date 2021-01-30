
#-- Codigos asociados a las llamadas al sistema
.eqv EXIT 10
.eqv PRINT_STRING 4
.eqv PRINT_INT 1
.eqv READ_STRING 8

#-- Definicion de macros para acceso al sistema operativo

#-- Terminar
.macro M_EXIT
  li a7, EXIT
  ecall
.end_macro

#-- Terminar devolviendo codigo de salida
.macro exit(%exit_code)
  li a0, %exit_code
  li a7, 93
  ecall
.end_macro

#-- Imprimir una cadena
.macro print_str(%str)
  .data
  mymsg: .string %str
  .text
  li a7, PRINT_STRING
  la a0, mymsg
  ecall
.end_macro

#-- Imprimir un entero
.macro print_int(%x)
  li a7, PRINT_INT
  li a0, %x
  ecall
.end_macro