#!/bin/bash
echo "-----Ejecutando TEST-05-----"

##-- Nombre del elemento a probar
ITEM="test_peso.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar ../$ITEM SOL_peso.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
