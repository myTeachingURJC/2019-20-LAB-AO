#!/bin/bash
echo "-----Ejecutando TEST-07-----"

##-- Nombre del elemento a probar
ITEM="pesomax.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar SOL_test_pesomax.s ../$ITEM SOL_peso.s SOL_max.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

##-- Mostrar cual deberia ser la salida correcta
echo ""
echo "*** SALIDA CORRECTA: ***"
echo ""
cat TEST-07-output.txt

read -p "------FIN-------"
