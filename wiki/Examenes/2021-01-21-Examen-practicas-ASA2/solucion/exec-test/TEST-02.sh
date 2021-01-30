#!/bin/bash
echo "-----Ejecutando TEST-02-----"

##-- Nombre del elemento a probar
ITEM="test_max.s"

echo ""
echo "PROBANDO: "$ITEM
echo ""

##-- Comando a ejecutar
cmd="java -jar rars1_5.jar ../$ITEM SOL_max.s"

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd

read -p "------FIN-------"
