#!/bin/bash
echo "-----Ejecutando TEST-05-----"

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar test_peso.s peso.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
