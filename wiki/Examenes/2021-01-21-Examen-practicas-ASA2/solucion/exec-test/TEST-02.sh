#!/bin/bash
echo "-----Ejecutando TEST-02-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS=10000

##-- Nombre del elemento a probar
ITEM="test_max.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
##-- Parametro ic: Muestra al final el numero de instrucciones
##--   ejecutadas
##-- Se para tambien como parametro el numero maximo de 
##-- pasos
cmd="java -jar rars1_5.jar ic $MAX_STEPS ../$ITEM SOL_max.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
