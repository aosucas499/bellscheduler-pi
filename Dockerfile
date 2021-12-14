#aosucas499/bell-scheduler
# basado en ubuntu 16 xenial para arm
# con repositorios de lliurex 16-32bits
# para raspebrry
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/bellscheduler-dre:armhf .

# Uso de la imagen y variables
FROM ubuntu:xenial
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

# Paquetes previos
RUN mkdir /etc/cron.d  && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p
RUN apt-get update && apt-get install nano wget ethtool ieee-data  -y 
RUN apt-get update && apt-get install -y --no-install-recommends libnotify-bin dbus dbus-x11 libusb-1.0 screen \
python-netaddr python-gobject python-pam python-openssl python-netifaces python-simplejson python-scp python-pyinotify \
sudo python3-pkg-resources python3-netifaces python3-gi python3-gi-cairo gir1.2-appindicator3-0.1 gir1.2-gtk-3.0 gir1.2-notify \
python-psutil ffmpeg && apt-get clean
RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/

# Instalar bell-scheduler

RUN wget http://lliurex.net/xenial/pool/main/t/taskscheduler/taskscheduler_1.1_all.deb && \
wget http://lliurex.net/xenial/pool/main/t/taskscheduler/python3-taskscheduler_1.1_all.deb && \
wget http://lliurex.net/xenial/pool/main/t/taskscheduler/n4d-taskscheduler-client_1.1_all.deb && \
wget http://lliurex.net/xenial/pool/main/t/taskscheduler/taskscheduler-data_1.1_all.deb && \
wget http://lliurex.net/xenial/pool/main/p/python-n4dgtklogin/python3-n4dgtklogin_0.5_all.deb && \
wget http://lliurex.net/xenial/pool/main/t/taskscheduler/n4d-taskscheduler-server_1.1_all.deb && \
dpkg -i *.deb && rm *.deb  
RUN wget http://lliurex.net/xenial/pool/main/n/n4d/n4d_0.117_all.deb && \ 
wget http://lliurex.net/xenial/pool/main/p/python-llxnet/llxnet-common_0.19.2_all.deb && \
wget http://lliurex.net/xenial/pool/main/p/python-llxnet/python-llxnet_0.19.2_all.deb && \
wget http://lliurex.net/xenial/pool/main/p/python-llxnet/python3-llxnet_0.19.2_all.deb && \
wget http://lliurex.net/xenial/pool/main/n/n4d-lliurex-base/n4d-lliurex-base_0.17.1_all.deb && \
wget http://lliurex.net/xenial/pool/main/n/n4d/n4d_0.117_all.deb && \
wget http://lliurex.net/xenial/pool/main/b/bell-scheduler/n4d-bellscheduler_0.4_all.deb && \
wget http://lliurex.net/xenial/pool/main/y/youtube-dl-dmo/youtube-dl_2018.11.23-dmo1+lliurex2_all.deb && \
wget http://lliurex.net/xenial/pool/main/h/holiday-manager/python3-holidaymanager_0.1.7_all.deb && \
wget http://lliurex.net/xenial/pool/main/h/holiday-manager/n4d-holidaymanager_0.1.7_all.deb && \
wget http://lliurex.net/xenial/pool/main/b/bell-scheduler/bell-scheduler_0.4_all.deb 
RUN dpkg -i n4d_* && dpkg -i *lxnet* && dpkg -i n4d-lliurex-base* && dpkg -i *.deb && rm *.deb

# bellscheduler modifications
COPY ./BellSchedulerManager.py /usr/share/n4d/python-plugins
COPY ./SchedulerClient.py /usr/share/n4d/python-plugins
COPY ./bellmanager.py /usr/lib/python3/dist-packages/bellscheduler/
COPY ./MainWindow.py /usr/lib/python3/dist-packages/bellscheduler/
COPY ./EditBox.py /usr/lib/python3/dist-packages/bellscheduler/
COPY ./bell-scheduler.ui /usr/lib/python3/dist-packages/bellscheduler/rsrc

RUN wget http://lliurex.net/xenial/pool/main/l/lliurex-artwork-icons/lliurex-artwork-icons-neu_4.2.5_all.deb && \
dpkg -i lliurex-artwork-icons-neu* && rm *.deb && \
rm -r /usr/share/icons/Adwaita && ln -s /usr/share/icons/lliurex-neu /usr/share/icons/Adwaita 

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/bin/bash", "-c", "/docker-entrypoint.sh" ]

