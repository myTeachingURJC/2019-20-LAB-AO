#!/bin/bash
echo "-----Ejecutando TEST-09-----"

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar test_pesomax.s pesomax.s peso.s max.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
