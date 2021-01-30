#!/bin/bash
echo "-----Ejecutando TEST-01-----"

##-- Nombre del elemento a probar
ITEM="max.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar TEST_max.s ../$ITEM"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
