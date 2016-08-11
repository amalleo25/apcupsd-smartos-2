#Work in progress

# apcupsd-smartos
How to install apcupsd in the smartos global zone. 

This guide focuses on how to setup apcupsd as a network slave. In my case, I have apcupsd installed on a raspberry pi which is connected to the UPS via USB and sends messgaes to the slaves.

At the time of this write up, 3.14.14 is the latest version of apcupsd.

http://www.apcupsd.org/

## Create new zone

imgadm import 088b97b0-e1a1-11e5-b895-9baa2086eb33

Copy and paste zone.json to provision new zone

## Setup acpupsd binary

zlogin uuid

pkgin up

pkgin in gmake

cd /tmp

wget http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3.14.14/apcupsd-3.14.14.tar.gz

tar -xvf apcupsd-3.14.14

cd apcupsd-3.14.14

configure ...

make

make install

