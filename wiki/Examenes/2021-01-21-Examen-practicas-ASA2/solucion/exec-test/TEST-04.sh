#!/bin/bash
echo "-----Ejecutando TEST-04-----"

##-- Nombre del elemento a probar
ITEM="peso.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar SOL_test_peso.s ../$ITEM"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

##-- Mostrar cual deberia ser la salida correcta
echo ""
echo "*** SALIDA CORRECTA: ***"
echo ""
cat TEST-04-output.txt

read -p "------FIN-------"
