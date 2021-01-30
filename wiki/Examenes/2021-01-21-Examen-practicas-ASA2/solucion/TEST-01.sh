#!/bin/bash
echo "-----Ejecutando TEST-01-----"

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar SOL_test_max.s max.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

##-- Mostrar cual deberia ser la salida correcta
echo ""
echo "*** SALIDA CORRECTA: ***"
echo ""
cat TEST-01-output.txt
read -p "------FIN-------"
