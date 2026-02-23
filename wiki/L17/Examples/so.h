# ===============================================
# Codigo de los servicios del sistema operativo
# ===============================================
    .eqv COD_PRINT_INT    1
    .eqv COD_READ_INT     5
    .eqv COD_PRINT_STRING 4
    .eqv COD_READ_STRING  8
    .eqv COD_PRINT_CHAR   11
    .eqv COD_READ_CHAR    12
    .eqv COD_EXIT         10
    .eqv COD_SLEEP         32
    .eqv COD_PRINT_INT_HEX 34
    .eqv COD_PRINT_INT_BIN 35


# -------------------------------------------
# - Macros de acceso DIRECTO a los servicios 
# -------------------------------------------
.macro EXIT
  li a7, COD_EXIT
  ecall
.end_macro

.macro PRINT_INT
  li a7, COD_PRINT_INT
  ecall
.end_macro

.macro PRINT_CHAR
  li a7, COD_PRINT_CHAR
  ecall
.end_macro

.macro PRINT_STRING
  li a7, COD_PRINT_STRING
  ecall
.end_macro

.macro PRINT_INT_HEX
  li a7, COD_PRINT_INT_HEX
  ecall
.end_macro

.macro PRINT_INT_BIN
  li a7, COD_PRINT_INT_BIN
  ecall
.end_macro

.macro READ_INT
  li a7, COD_READ_INT
  ecall
.end_macro

.macro READ_STRING
  li a7, COD_READ_STRING
  ecall
.end_macro

.macro READ_CHAR
  li a7, COD_READ_CHAR
  ecall
.end_macro

.macro SLEEP
  li a7, COD_SLEEP
  ecall
.end_macro

# -------------------------------------------
# -- Macros ESPECIFICAS de los servicios
# -------------------------------------------

#-- Impresión de un entero INMEDIATO (constante)
.macro PRINT_INTI(%cte)
  li a0, %cte
  PRINT_INT
.end_macro

#-- Impresion de un entero en un registro
.macro PRINT_INTR(%reg)
  mv a0, %reg
  PRINT_INT
.end_macro

#-------------- PRINT_STRING

.macro PRINT_STRINGI(%str)
  .data
  msg:  .string %str
  .text
  la a0, msg
  PRINT_STRING
.end_macro

.macro PRINT_STRINGL(%label)
  la a0, %label
  PRINT_STRING
.end_macro

.macro PRINT_STRINGR(%reg)
  mv a0, %reg
  PRINT_STRING
.end_macro

#---------------- READ_STRING
.macro READ_STRINGL(%label, %max)
  la a0, %label
  li a1, %max
  READ_STRING
.end_macro

.macro READ_STRINGR(%reg, %max)
  mv a0, %reg
  li a1, %max
  READ_STRING
.end_macro

#------------------ PRINT_CHAR

.macro PRINT_CHARI(%car)
   li a0, %car
   PRINT_CHAR
.end_macro

.macro PRINT_CHARR(%reg)
   mv a0, %reg
   PRINT_CHAR
.end_macro

.macro SLEEPI(%cte)
  li a0, %cte
  SLEEP
.end_macro

.macro SLEEPR(%reg)
  mv a0, %reg
  SLEEP
.end_macro
#------------------- PRINT_INT_HEX

#-- Impresión de un entero INMEDIATO (constante)
.macro PRINT_INT_HEXI(%cte)
  li a0, %cte
  PRINT_INT_HEX
.end_macro

#-- Impresion de un entero en un registro
.macro PRINT_INT_HEXR(%reg)
  mv a0, %reg
  PRINT_INT_HEX
.end_macro


#------------------- PRINT_INT_BINARY

#-- Impresión de un entero INMEDIATO (constante)
.macro PRINT_INT_BINI(%cte)
  li a0, %cte
  PRINT_INT_BIN
.end_macro

#-- Impresion de un entero en un registro
.macro PRINT_INT_BINR(%reg)
  mv a0, %reg
  PRINT_INT_BIN
.end_macro


