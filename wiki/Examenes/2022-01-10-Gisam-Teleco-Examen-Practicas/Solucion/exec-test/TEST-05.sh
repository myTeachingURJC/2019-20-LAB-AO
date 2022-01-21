#!/bin/bash
echo "-----Ejecutando TEST-05-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS=10000

##-- Nombre del elemento a probar
ITEM1="dec2bin.s"
ITEM2="printbin.s"
INPUT_DATA="test-4-data.txt"

echo ""
echo "PROBANDO: $ITEM1, $ITEM2"
echo ""

##-- Comando a ejecutar
##-- Parametro ic: Muestra al final el numero de instrucciones
##--   ejecutadas
##-- Se para tambien como parametro el numero maximo de 
##-- pasos
cmd="java -jar rars1_5.jar ic $MAX_STEPS ../$ITEM1 ../$ITEM2"

##-- Mostrar comando en consola y ejecutarlo
##echo $cmd
$cmd < $INPUT_DATA

read -p "------FIN-------"
