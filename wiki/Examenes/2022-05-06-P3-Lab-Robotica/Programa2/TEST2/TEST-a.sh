#!/bin/bash
clear
echo "-----Ejecutando TEST-a-1-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS="10000"

##-- Nombre del fichero con la funcion a probar, creada por el estudiante
ITEM1="02_bloque.s"
ITEM2="02_linea.s"

##-- Nombre del programa principal de prueba
TESTB="02_main_TB.s"

##-- Nombre del RARs
RARS="rars1_5.jar"

##-- Fichero donde almacenar la salida del RARS
OUTPUT_ERR="output_err.txt"

##-- Fichero donde almacenar la salida de la consola del programa
CONSOLE="console.txt"

##-- Salida exacta por la consola:
linea_menos_OK="-----"
linea_igual_OK="====="
linea_O_OK="OOOOO"
convenio_OK="Convenio OK!!"


##-- Borrar los ficheros temporales generados en una
##-- ejecucion previa
rm -f $OUTPUT_ERR
rm -f $CONSOLE

### Comprobar que el RARS está en directorio

if [ -f "$RARS" ]
then
  echo "> ✅️ $RARS existe"
else
  echo ">> ❌️ ERROR: $RARS no está en el directorio"
  read -p "------FIN-------"
  exit 1
fi

### Comprobar si el fichero a probar existe

if [ -f "../$ITEM1" ]
then
  echo "> ✅️ $ITEM1 existe"
else
  echo ""
  echo ">> ❌️ ERROR: $ITEM1 no encontrado (🔥️ERROR DE ESPECIFICACIONES)"
  read -p "------FIN-------"
  exit 1
fi

echo ""
echo "> ➡️  PROBANDO: "$ITEM1


##--------------------------
##-- Comando a ejecutar
#---------------------------
##-- Parametros pasados al RARS:
##-- nc: No mostrar el mensaje de copyright inicial
##-- me: Mostrar los mensajes del RARs en la salida de error
##-- ic: Imprimir al final el numero de instrucciones basicas ejecutadas
##-- 
cmd="java -jar rars1_5.jar nc me ic $MAX_STEPS $TESTB ../$ITEM1 $ITEM2" 

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd >$CONSOLE 2>$OUTPUT_ERR 
echo ""

##-- Comprobar si ha habido errores de ensamblado o en tiempo de ejecucion
if grep -q "Runtime exception" $OUTPUT_ERR;
then
  echo "> ❌️ ERROR en tiempo de ejecución. Ha PETADO 😱️😱️"
  echo ""
  exit 1
else
  #-- Si no es de runtime comprobamos si es de ensamblado
  if grep -q "Error in" $OUTPUT_ERR; then
    echo "> ❌️ ERROR: El programa NO ensambla 😱️😱️"
    echo ""
    cat $OUTPUT_ERR
    read -p "------FIN-------"
    exit 1
  fi
fi

##-- Leer los ciclos
ciclos=`tail -n1 $OUTPUT_ERR`

if [ "$ciclos" = $MAX_STEPS ]
then
  echo "> ❌️ ERROR: Bucle infinito. El programa NO termina"
  echo ""
fi

#-----------------------------------------------------------
#-- Conprobar linea por linea si el resultado es correcto
#-----------------------------------------------------------

linea1=`head -n1 $CONSOLE`
linea2=`head -n2 $CONSOLE | tail -1`
linea3=`head -n3 $CONSOLE | tail -1`
linea4=`head -n4 $CONSOLE | tail -1`
linea5=`head -n5 $CONSOLE | tail -1`
linea6=`head -n6 $CONSOLE | tail -1`
linea7=`head -n7 $CONSOLE | tail -1`
linea8=`head -n8 $CONSOLE | tail -1`
linea9=`head -n9 $CONSOLE | tail -1`
linea10=`head -n10 $CONSOLE | tail -1`
linea11=`head -n11 $CONSOLE | tail -1`
linea12=`head -n12 $CONSOLE | tail -1`

echo "> COMPROBANDO VALORES recibidos"

#linea_menos_OK="-----"
#linea_igual_OK="====="
#linea_O_OK="OOOOO"

#-- Comprobar linea 1
if [ "$linea1" = "$linea_menos_OK" ]
then
  echo "> ✅️ Linea 1 OK!"
else
  echo "> ❌️ Linea 1 ERROR: $linea1 Debería ser: $linea_menos_OK"
fi

#-- Comprobar linea 2
if [ "$linea2" = "$linea_menos_OK" ]
then
  echo "> ✅️ Linea 2 OK!"
else
  echo "> ❌️ Linea 2 ERROR: $linea2 Debería ser: $linea_menos_OK"
fi

#-- Comprobar linea 3: Convenio OK
if [ "$linea3" = "$convenio_OK" ]
then
  echo "> ✅️ Convenio OK!"
else
  echo "> ❌️ Violación del convenio"
fi

#-- Comprobar linea 4
if [ "$linea4" = "$linea_igual_OK" ]
then
  echo "> ✅️ Linea 4 OK!"
else
  echo "> ❌️ Linea 4 ERROR: $linea4 Debería ser: $linea_igual_OK"
fi

#-- Comprobar linea 5
if [ "$linea5" = "$linea_igual_OK" ]
then
  echo "> ✅️ Linea 5 OK!"
else
  echo "> ❌️ Linea 5 ERROR: $linea5 Debería ser: $linea_igual_OK"
fi

#-- Comprobar linea 6
if [ "$linea6" = "$linea_igual_OK" ]
then
  echo "> ✅️ Linea 6 OK!"
else
  echo "> ❌️ Linea 6 ERROR: $linea6 Debería ser: $linea_igual_OK"
fi

#-- Comprobar linea 7: Convenio OK
if [ "$linea7" = "$convenio_OK" ]
then
  echo "> ✅️ Convenio OK!"
else
  echo "> ❌️ Violación del convenio"
fi

#-- Comprobar linea 8
if [ "$linea8" = "$linea_O_OK" ]
then
  echo "> ✅️ Linea 8 OK!"
else
  echo "> ❌️ Linea 8 ERROR: $linea8 Debería ser: $linea_O_OK"
fi

#-- Comprobar linea 9
if [ "$linea9" = "$linea_O_OK" ]
then
  echo "> ✅️ Linea 9 OK!"
else
  echo "> ❌️ Linea 9 ERROR: $linea9 Debería ser: $linea_O_OK"
fi

#-- Comprobar linea 10
if [ "$linea10" = "$linea_O_OK" ]
then
  echo "> ✅️ Linea 10 OK!"
else
  echo "> ❌️ Linea 10 ERROR: $linea10 Debería ser: $linea_O_OK"
fi

#-- Comprobar linea 11
if [ "$linea11" = "$linea_O_OK" ]
then
  echo "> ✅️ Linea 11 OK!"
else
  echo "> ❌️ Linea 11 ERROR: $linea11 Debería ser: $linea_O_OK"
fi

#-- Comprobar linea 12: Convenio OK
if [ "$linea12" = "$convenio_OK" ]
then
  echo "> ✅️ Convenio OK!"
else
  echo "> ❌️ Violación del convenio"
fi


echo ""

echo "> Salida en consola: "
cat $CONSOLE

##-- Imprimir los ciclos de ejecucion
echo "> Ciclos de ejecución: $ciclos"

##-- Comprobar si el programa no termina de forma controlada
if grep -q "dropping off" $OUTPUT_ERR; then
  echo "> ❌️ ERROR: El programa no termina llamando al sistema operativo"
fi

##-- Comprobar si termina con normalidad, llamando a exit
if grep -q "calling exit" $OUTPUT_ERR; then
  echo "> ✅️ El programa termina llamando a EXIT"
fi


echo ""
read -p "------FIN-------"




