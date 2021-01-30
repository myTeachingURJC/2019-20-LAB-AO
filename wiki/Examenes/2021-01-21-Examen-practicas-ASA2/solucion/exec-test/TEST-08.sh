#!/bin/bash
echo "-----Ejecutando TEST-08-----"

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar test_pesomax.s SOL_pesomax.s SOL_peso.s SOL_max.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
