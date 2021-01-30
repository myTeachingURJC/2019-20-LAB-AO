#!/bin/bash
echo "-----Ejecutando TEST-09-----"

##-- Nombre del elemento a probar
ITEM1="test_pesomax.s"
ITEM2="pesomax.s"
ITEM3="peso.s"
ITEM4="max.s"


echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar ../$ITEM1 ../$ITEM2 ../$ITEM3 ../$ITEM4"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
