#Work in progress

# apcupsd-smartos

This guide focuses on how to setup apcupsd as a network slave. In my case, I have apcupsd installed on a raspberry pi which is connected to the UPS via USB and talks to the slaves.

At the time of this write up, 3.14.14 is the latest version of apcupsd.

http://www.apcupsd.org/

## Create new zone
```
sh setup-zone.sh
zlogin uuid
sh apcupsd-install.sh
```

## Install apcupsd

