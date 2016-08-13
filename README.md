#Work in progress

# apcupsd-smartos

This script will setup apcupsd in the global zone as a network slave. In my case, I have apcupsd installed on a raspberry pi which is connected to the UPS via USB and talks to the slaves.

Tested on SmartOS 20160721T174418Z

At the time of this write up, 3.14.14 is the latest version of apcupsd.

http://www.apcupsd.org/

##Quickstart
Unzip and copy to global zone
```
cd apcupsd-smartos
sh apcupsd-install.sh
```
Edit apcupsd.conf and change DEVICE line to apcupsd server, i.e DEVICE 192.168.1.114:3551
```
vi /opt/local/etc/apcupsd/apcupsd.conf
```
I would also suggest editing the doshutdown command in apccontrol from init 0 to init 5.
```
vi /opt/local/etc/apcupsd/apccontrol
```
${SHUTDOWN} -y -g0 -i5

Reboot to load and start the service
```
init 6
```

