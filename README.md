# Bell Scheduler-pi

Aplicación [dockerizada](https://www.docker.com/) Bell-Scheduler para su uso en Raspberry Pi. (comprobada en Raspberry Pi 3).

![](https://www.kubii.es/7147-large_default/raspberry-pi-3-modelo-b-1-gb-kubii.jpg)

**Bell Scheduler** es una aplicación destinada a programar alarmas reproduciendo el sonido que se haya asociado en cada alarma, a los días de la semana y horas programadas.

El proyecto nace de la necesidad de programar alarmas que suenen en los tramos horarios del colegio. Primeramente se usó un PC con el proyecto [BellScheduler-dre](https://github.com/aosucas499/bellscheduler-dre) y posteriormente con este proyecto se instala la app en una raspberry pi que se enciende cada mañana automáticamente con un temporizador donde se enchufa la raspberry y se apaga al final la jornada.

El sistema de megafonía del colegio va enchufado por cable de audio al jack 3,5mm de la raspberry pi, por tanto, **es importante seleccionar la salida de audio del sistema de la raspberry, cambiando la salida HDMI a salida analógica.** (Se hace en la esquina superior derecha del sistema, pulsando con el botón derecho en el icono del altavos.)

Tras configurar los sonidos, las horas y los días con la app bellscheduler-pi, la raspberry pi será accesible por [SAMBA](https://github.com/aosucas499/bellscheduler-pi/wiki/Sonidos-y-copia-de-seguridad-de-Android-a-la-Raspberry) para enviar sonidos y copias de seguridad y por [VNC](https://www.programoergosum.es/tutoriales/escritorio-remoto-a-traves-de-vnc/) para acceder al escritorio y poder manegarla remotamente sin necesitar un monitor.


Esta aplicación proviene del sistema [Lliurex](https://portal.edu.gva.es/lliurex/va/descarregues/).

![](https://github.com/aosucas499/bellscheduler-dre/raw/main/icons/bellscheduler-place.png)

![](https://github.com/aosucas499/bellscheduler-dre/raw/main/bellscheduler-dre-appindicator/screenshot.png)

## Compatibilidad y funcionamiento
+ Compatible con [Raspberry Pi OS](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-legacy) (Legacy basado en debian buster). No descarges el más actual, utiliza la versión Legacy.
+ Sonido a las horas y días de la semana programados, usando archivos de sonido.
+ Usa archivos de audio alojados en tu sistema, explicado en la [WIKI.](https://github.com/aosucas499/bellscheduler-pi/wiki/Usar-archivos-de-audio-con-el-programa)
+ Importar y Exportar alarmas (si usas backup de la app original de Lliurex, leer la [WIKI.](https://github.com/aosucas499/bellscheduler-pi/wiki/Exportar-alarmas-de-la-app-original-de-lliurex)
+ App en la barra de notificaciones que para la música en caso necesario.

![](https://github.com/aosucas499/bellscheduler-dre/raw/main/icons/bell-scheduler-dre.png)

## Opciones borradas de la app original
+ Repoducción de canciones aleatorias de un directorio.
+ Holidays control (es mejor no incorporar esta función, basta con tener el dispositivo silenciado o apagado el día que es festivo).
+ Usar sonido desde YOUTUBE (esta función no está incorporada, no funcionaba bien en la versión original y se corre el riesgo de que no descargue el sonido para la hora programada).

## INSTALL

    sudo apt-get update -y

    git clone https://github.com/aosucas499/bellscheduler-pi.git

    cd bellscheduler-pi
    
    chmod +x install-bellscheduler-dre

    ./install-bellscheduler-dre
    
    sudo reboot (Reboot the system - Reiniciar el sistema)

## TUTORIALES

+ Intrucciones y recomendaciones de configuración del sistema: [Aquí](https://github.com/aosucas499/bellscheduler-pi/wiki/Preconfiguraci%C3%B3n-del-sistema)

+ Manual de Instrucciones de la app original (puede que alguna función no funcione): [Aquí](https://github.com/aosucas499/bellscheduler-dre/raw/docker-xenial/manual%20de%20Bell%20Scheduler-alarmas%20del%20cole.pdf)

+ Usa archivos de audio alojados en tu sistema: [Aquí](https://github.com/aosucas499/bellscheduler-pi/wiki/Usar-archivos-de-audio-con-el-programa)

+ Importar y Exportar alarmas (si usas backup de la app original de Lliurex, leer la [WIKI.](https://github.com/aosucas499/bellscheduler-pi/wiki/Exportar-alarmas-de-la-app-original-de-lliurex)

+ Acceder a la raspberry de forma remota desde otro PC para no necesitar monitor en la Raspberry PI: [Aquí](https://www.programoergosum.es/tutoriales/escritorio-remoto-a-traves-de-vnc/) 

+ Copiar sonidos y copia de seguridad de Android a la Raspberry: [Aquí](https://github.com/aosucas499/bellscheduler-pi/wiki/Sonidos-y-copia-de-seguridad-de-Android-a-la-Raspberry)

<b>Thanks to</b> [Lliurex Team](https://portal.edu.gva.es/lliurex/va/) 

<b>Gracias</b> al equipo de Lliurex Team, basé mi dockerfile en su [app](http://wiki.lliurex.net/tiki-index.php?page=Bell+Scheduler).
