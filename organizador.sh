#!/bin/Bash
 #//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 #este es el mejor codigop de organizador añadi opinion
 #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   

# lo que hace el comando de arriba es que llama como por decirlo así a nuestro traductor el que va a traduciur lo sigiente que pongamos a lenguaje computador si no se pone no funciona el script
if [ ! -d "$1" ]; then
  echo "No existe ningun directorio $1 verificalo porfavor"
  exit 1
 else
  echo "organisando archivos de $1"
fi
   # basicamente la que hace es que por la bandera -d y ! lo que dice es si no existe ningin directorio entonces muestra en pantalla qu8e no existe y que se verifique y en ese caso termina el escript en caso de que no  sea así muestra que se esta  organizando y continua al siguiente paso
 archivos=( "$1"/*.txt )
if [ ! -e "${archivos[0]}" ] && [ "${archivos[0]}" = "$1"/*.txt ]; then
  echo "no existe ningun archivo.txt en $1"
  exit 1
   # hasta acá dice que si no hay archivos muestre en pantalla queno hay archivos y en esa caso acaba ahí el fichero 
 else
  echo "hay un total de ${#archivos[@]} archivos .txt"
fi
   # acáuestra que como ya comprobamos que hay archivos y que hay archivos.txt entonces muestreme en pantalla cuantos archivos hay
 fecha=$(date "+%y-%m-%d")
   # acá lo que hacemos es definir la variable fecha introduciendo enella la fecha y como queremos que sea
  mkdir -p "buckup_$fecha"
   # acá creamos la carpeta o el directorio donde vamos a guardar nuestras copias y que sea un directorio padre
for a in "$1"/*.txt; do
if [ -f "$a" ]; then
 nombre=$(basename "$a")
   # acá decimos que para todo directorio en uno con extención txt lo meta en a  y que despues fuerce coger el nombre de a y haga lo nque dice abajo 
  cp "$a" "buckup_$fecha/${fecha}_copia_$nombre"
   # y que despues coga esos archivos con esos nombres y que los coloque en la capeta que ya habiamos creado  y que a cada uno los pegue pero que tambien que les cambie el nombre y que coloque primero la fecha despues que coloque copia y despues el nombre que aparece en a
fi
done
  echo "se han creado las copias en el directorio buckup$fecha"
   #hasta ahora  se crearon las copias y se hanguardado una vez lo haga mostrara que se guardo y en donde
if [ ! -d "buckup_$fecha" ]; then
 echo "Error: El directorio buckup_$fecha no existe."
 exit 1
   #hasta acá hago una comprobación de que realmente el directorio que hice si existe
fi
  arch=( "buckup_$fecha"/*.txt )
   #acá solo pongo todos los archivos.txt del directorio que acabo de crear en la variable arch
if [ ! -e "${arch[0]}" ] && [ "${arch[0]}" = "buckup_$fecha"/*.txt ]; then 
  total=0
   #si no hay archivos.txt va a decir que el total es cero
else
 total=${#arch[@]}
   #por el contrario, si existen entonces digame cuantos hay 
fi
 {
  echo "Resumen de archivos"
  echo "Total: $total"
#no puede faltar que lo muestreen pantalla
i=1
  echo "listado de copias"
#ahora lo que hacemos es utilizar la i como un contador, comoloq uehacemos en las sumatorias
for copia in "buckup_$fecha"/*.txt; do
if [ -f "$copia" ]; then
#acá creamos una variable llamada copia y en ella esta contenida todos los archivos .txt del directorio que creamos y revisa que sean archivos normales y con normalesme refiero a que no sea un directorio o algo por el estilo
  echo "$i. $(basename "$copia")"
 ((i++))
# acálo que dice es muestreme elcontador o elnumeroque en ese punto tengaelcontador  de primeras y despues muestrame el nombre del archivo de la variable copia adeás sumale uno al contador cuando termines con este archivo y vuelve a hacer esto hasta que no queden más archivos
fi
done
}>"buckup_$fecha/resumen.log"
#mete todo esto en resumen log que va a estar dentro de buckup_$fecha
  echo "Resumen total de archivos se guardo en en buckup_$fecha/resumen.log"
  echo "ya por fin se termino y se guardo"
#y por ultimo muestrame que ya se realizo el proceso y que concluyo correctamente
 n=O
 echo "quiero saber tu opinion por favor que puntaje le das al trabajo, del 1 al 5 y con numeros enteros porfa tu opinio nos interesa"
 read n
 echo "la nota que le diste a este fichero es "$n""
 exit 0

