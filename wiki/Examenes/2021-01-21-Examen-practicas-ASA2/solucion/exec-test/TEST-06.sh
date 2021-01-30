#!/bin/bash
echo "-----Ejecutando TEST-05-----"

##-- Nombre del elemento a probar
ITEM1="test_peso.s"
ITEM2="peso.s"

echo ""
echo "PROBANDO: $ITEM1, $ITEM2"
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar ../$ITEM1 ../$ITEM2"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
