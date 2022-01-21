#!/bin/bash
echo "-----Ejecutando TEST-07-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS=10000

##-- Nombre del elemento a probar
ITEM1="test_printbin2.s"
TEST1="TEST_test_printbin.s"
ITEM2="printbin.s"



echo ""
echo "PROBANDO: $ITEM1, $ITEM2"
echo ""

##-- Comando a ejecutar
##-- Parametro ic: Muestra al final el numero de instrucciones
##--   ejecutadas
##-- Se para tambien como parametro el numero maximo de 
##-- pasos
cmd="java -jar rars1_5.jar ic $MAX_STEPS $TEST1 ../$ITEM1  ../$ITEM2"

##-- Mostrar comando en consola y ejecutarlo
##echo $cmd
$cmd 

read -p "------FIN-------"
