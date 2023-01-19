#!/bin/bash
clear
echo "-----Ejecutando TEST-a-1-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS="10000"

##-- Nombre del fichero con la funcion a probar, creada por el estudiante
ITEM="doble.s"

##-- Nombre del programa principal de prueba
TESTB="main_TB.s"

##-- Nombre del RARs
RARS="rars1_5.jar"

##-- Fichero donde almacenar la salida del RARS
OUTPUT_ERR="output_err.txt"

##-- Fichero donde almacenar la salida de la consola del programa
CONSOLE="console.txt"

##-- Salida exacta por la consola:
linea1_OK="16"
linea3_OK="2"
linea5_OK="32"
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

if [ -f "../$ITEM" ]
then
  echo "> ✅️ $ITEM existe"
else
  echo ""
  echo ">> ❌️ ERROR: $ITEM no encontrado (🔥️ERROR DE ESPECIFICACIONES)"
  read -p "------FIN-------"
  exit 1
fi

echo ""
echo "> ➡️  PROBANDO: "$ITEM


##--------------------------
##-- Comando a ejecutar
#---------------------------
##-- Parametros pasados al RARS:
##-- nc: No mostrar el mensaje de copyright inicial
##-- me: Mostrar los mensajes del RARs en la salida de error
##-- ic: Imprimir al final el numero de instrucciones basicas ejecutadas
##-- 
cmd="java -jar rars1_5.jar nc me ic $MAX_STEPS $TESTB ../$ITEM" 

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

echo "> COMPROBANDO VALORES recibidos"

#-- Comprobar linea 1: doble(8)
if [ "$linea1" = "$linea1_OK" ]
then
  echo "> ✅️ doble(8)=16. OK!"
else
  echo "> ❌️ doble(8)= $linea1. Debería ser: $linea1_OK"
fi

#-- Comprobar linea 2: Convenio OK
if [ "$linea2" = "$convenio_OK" ]
then
  echo "> ✅️ Convenio OK!"
else
  echo "> ❌️ Violación del convenio"
fi

#-- Comprobar linea 3: doble(1)
if [ "$linea3" = "$linea3_OK" ]
then
  echo "> ✅️ doble(1)=2. OK!"
else
  echo "> ❌️ doble(1)= $linea3. Debería ser: $linea3_OK"
fi

#-- Comprobar linea 4: Convenio OK
if [ "$linea4" = "$convenio_OK" ]
then
  echo "> ✅️ Convenio OK!"
else
  echo "> ❌️ Violación del convenio"
fi

#-- Comprobar linea 5: doble(16)
if [ "$linea5" = "$linea5_OK" ]
then
  echo "> ✅️ doble(16)=32. OK!"
else
  echo "> ❌️ doble(16)= $linea5. Debería ser: $linea5_OK"
fi

#-- Comprobar linea 4: Convenio OK
if [ "$linea6" = "$convenio_OK" ]
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




