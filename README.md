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
Edit apcupsd.conf and change DEVICE line to apcupsd master (e.g, DEVICE 192.168.1.114:3551)
```
vi /opt/local/etc/apcupsd/apcupsd.conf
```
I would also suggest editing the doshutdown command in apccontrol from init 0 to init 5.
```
vi /opt/local/etc/apcupsd/apccontrol
```
${SHUTDOWN} -y -g0 -i5

Reboot SmartOS to load and start the service
```
init 6
```

Run apcaccess command to test for proper connectivity.
```
[root@smartos ~]# apcaccess
APC      : 001,027,0696
DATE     : 2016-08-13 18:15:17 +0000
HOSTNAME : smartos
VERSION  : 3.14.14 (31 May 2016) sun
UPSNAME  : raspberrypi
CABLE    : Ethernet Link
DRIVER   : NETWORK UPS Driver
UPSMODE  : Stand Alone
STARTTIME: 2016-08-13 18:15:17 +0000
MASTERUPD: 2016-08-13 18:15:17 +0000
MASTER   : 192.168.1.114:3551
MODEL    : Smart-UPS 750
STATUS   : ONLINE SLAVE
BCHARGE  : 100.0 Percent
TIMELEFT : 72.0 Minutes
MBATTCHG : 80 Percent
MINTIMEL : 60 Minutes
MAXTIME  : 0 Seconds
BATTV    : 27.0 Volts
NUMXFERS : 0
TONBATT  : 0 Seconds
CUMONBATT: 0 Seconds
XOFFBATT : N/A
STATFLAG : 0x07000408
SERIALNO : AS1531323860
NOMBATTV : 24.0 Volts
FIRMWARE : UPS 09.3 / ID=18
END APC  : 2016-08-13 18:15:18 +0000
```

