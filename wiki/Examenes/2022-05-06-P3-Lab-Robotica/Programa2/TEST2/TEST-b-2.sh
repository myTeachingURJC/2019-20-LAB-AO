#!/bin/bash
clear
echo "-----Ejecutando TEST-b-1"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS="10000"

##-- Nombre del fichero con la funcion a probar (Test Bench)
ITEM1="02_bloque.s"
ITEM2="02_linea.s"

##-- Nombre del programa principal de prueba (Estudiante)
MAIN="02_main.s"

##-- Nombre del RARs
RARS="rars1_5.jar"

##-- Fichero con el volcado del segmento de codigo
CODEFILE="code.hex"

##-- Fichero donde almacenar la salida del RARS
OUTPUT_ERR="output_err.txt"

##-- Fichero donde almacenar la salida de la consola del programa
CONSOLE="console.txt"

##-- Borrar los ficheros temporales generados en una
##-- ejecucion previa
rm -f $OUTPUT_ERR
rm -f $CODEFILE
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

### Comprobar si el fichero existe

if [ -f "../$MAIN" ]
then
  echo "> ✅️ $MAIN existe"
else
  echo ""
  echo ">> ❌️ ERROR: $MAIN no encontrado (🔥️ERROR DE ESPECIFICACIONES)"
  read -p "------FIN-------"
  exit 1
fi

echo ""
echo "> ➡️  PROBANDO: "$MAIN


##--------------------------
##-- Comando a ejecutar
#---------------------------
##-- Parametros pasados al RARS:
##-- nc: No mostrar el mensaje de copyright inicial
##-- me: Mostrar los mensajes del RARs en la salida de error
##-- ic: Imprimir al final el numero de instrucciones basicas ejecutadas
##-- 
cmd="java -jar rars1_5.jar nc me ic $MAX_STEPS \
     dump .text HexText $CODEFILE ../$MAIN ../$ITEM1 $ITEM2" 

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd >$CONSOLE 2>$OUTPUT_ERR
echo ""

##-- Comprobar si ha habido errores de ensamblado o en tiempo de ejecucion
if grep -q "Runtime exception" $OUTPUT_ERR;
then
  echo "> ❌️ ERROR en tiempo de ejecución. Ha PETADO 😱️😱️"
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

##-- Comprobar si el programa no termina de forma controlada
if grep -q "dropping off" $OUTPUT_ERR; then
  echo "> ❌️ ERROR: El programa no termina llamando al sistema operativo"
fi

##-- Leer el numero total de instrucciones
ninst=`cat $CODEFILE | wc -l`

##-- Leer los ciclos
ciclos=`tail -n1 $OUTPUT_ERR`

if [ "$ciclos" = $MAX_STEPS ]
then
  echo "> ❌️ ERROR: Bucle infinito. El programa NO termina"
fi

#-- Leer las dos lineas de salida en consola
linea1=`head -n1 $CONSOLE`
linea2=`head -n2 $CONSOLE | tail -1`
linea3=`head -n3 $CONSOLE | tail -1`
linea4=`head -n4 $CONSOLE | tail -1`
linea5=`head -n5 $CONSOLE | tail -1`
linea6=`head -n6 $CONSOLE | tail -1`
linea7=`head -n7 $CONSOLE | tail -1`
linea8=`head -n8 $CONSOLE | tail -1`

linea_AST_OK="*****"
linea_X_OK="XXXXX"
linea_NL_OK=""

#-- Comprobar la salida por consola
if [ "$linea1" = "$linea_AST_OK" ]
then
  echo "> ✅️ Linea *: OK!"
else
  echo 
  echo "> ❌️ Linea *: Salida incorrecta: $linea1. Deberia ser: $linea_AST_OK"
fi

#-- Comprobar la salida por consola
if [ "$linea2" = "$linea_AST_OK" ]
then
  echo "> ✅️ Linea *: OK!"
else
  echo 
  echo "> ❌️ Linea *: Salida incorrecta: $linea2. Deberia ser: $linea_AST_OK"
fi

#-- Comprobar la salida por consola
if [ "$linea3" = "$linea_AST_OK" ]
then
  echo "> ✅️ Linea *: OK!"
else
  echo 
  echo "> ❌️ Linea *: Salida incorrecta: $linea3. Deberia ser: $linea_AST_OK"
fi

#-- Comprobar la salida por consola
if [ "$linea4" = "$linea_NL_OK" ]
then
  echo "> ✅️   Salto de linea OK!"
else
  echo 
  echo "> ❌️ Linea: Falta \n"
fi

#-- Comprobar la salida por consola
if [ "$linea5" = "$linea_X_OK" ]
then
  echo "> ✅️ Linea X: OK!"
else
  echo 
  echo "> ❌️ Linea X: Salida incorrecta: $linea5. Deberia ser: $linea_X_OK"
fi

#-- Comprobar la salida por consola
if [ "$linea6" = "$linea_X_OK" ]
then
  echo "> ✅️ Linea X: OK!"
else
  echo 
  echo "> ❌️ Linea X: Salida incorrecta: $linea6. Deberia ser: $linea_X_OK"
fi

#-- Comprobar la salida por consola
if [ "$linea7" = "$linea_X_OK" ]
then
  echo "> ✅️ Linea X: OK!"
else
  echo 
  echo "> ❌️ Linea X: Salida incorrecta: $linea7. Deberia ser: $linea_X_OK"
fi

#-- Comprobar la salida por consola
if [ "$linea8" = "$linea_X_OK" ]
then
  echo "> ✅️ Linea X: OK!"
else
  echo 
  echo "> ❌️ Linea X: Salida incorrecta: $linea8. Deberia ser: $linea_X_OK"
fi


echo ""
echo "> Instrucciones totales: $ninst"
echo "> Ciclos de ejecución: $ciclos"


##-- Comprobar si termina con normalidad, llamando a exit
if grep -q "calling exit" $OUTPUT_ERR; then
  echo "> ✅️ El programa termina llamando a EXIT"
fi

echo "> Salida en consola: "
cat $CONSOLE

echo ""
read -p "------FIN-------"



