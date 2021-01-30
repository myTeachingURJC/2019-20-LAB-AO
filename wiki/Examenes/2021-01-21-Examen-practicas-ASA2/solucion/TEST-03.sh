#!/bin/bash
echo "-----Ejecutando TEST-03-----"

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar test_max.s max.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
