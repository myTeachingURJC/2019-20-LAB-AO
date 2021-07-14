#!/bin/bash
echo "-----Ejecutando TEST-04-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS=10000

##-- Nombre del elemento a probar
ITEM="print_mul5.s"

##-- Nombre del TEST a usar
TEST="TEST_print_mul5.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
##-- Parametro ic: Muestra al final el numero de instrucciones
##--   ejecutadas
##-- Se pasa tambien como parametro el numero maximo de 
##-- pasos
cmd="java -jar rars1_5.jar ic  $MAX_STEPS $TEST ../$ITEM mul5.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
