#!/bin/bash
echo "-----Ejecutando TEST-04-----"

##-- Nombre del elemento a probar
ITEM="peso.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar 10000 ic TEST_peso.s ../$ITEM"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
