#!/bin/bash
echo "-----Ejecutando TEST-05-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS=10000

##-- Nombre del elemento a probar
ITEM="main.s"

##-- Libreria con las funciones SOLUCION
TEST="SOL_print_mul5.s"

INPUT_DATA="test-5-data.txt"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
##-- Parametro ic: Muestra al final el numero de instrucciones
##--   ejecutadas
##-- Se para tambien como parametro el numero maximo de 
##-- pasos
cmd="java -jar rars1_5.jar ic $MAX_STEPS ../$ITEM $TEST mul5.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
#$cmd
$cmd < $INPUT_DATA


read -p "------FIN-------"
