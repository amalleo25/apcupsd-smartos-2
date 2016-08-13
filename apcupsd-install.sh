#!/bin/bash

#Setup directories for apcupsd installation
mkdir -p /opt/custom/smf /opt/local/lib/svc/method /opt/local/sbin /opt/local/etc/apcupsd \
/opt/local/man/man5 /opt/local/man/man8 2>/dev/null

#chgrp sys /opt/local/sbin
#chgrp sys /opt/local/etc

cp ./apcupsd.xml /opt/custom/smf
cp ./smartos-setup.xml /opt/custom/smf
cp ./apcupsd.sh /opt/local/lib/svc/method
cp ./smartos-setup.sh /opt/local/lib/svc/method

#Import base-64-lts 15.4.1 smartos zone-dataset 2016-03-04
imgadm import 088b97b0-e1a1-11e5-b895-9baa2086eb33

#vmadm create -f ./zone.json
uuid=$(vmadm create -f zone.json 2>&1 | cut -d " " -f 4)

cp ./zone-install.sh /zones/$uuid/root/root

zlogin $uuid sh zone-install.sh

#vmadm delete $uuid

#svcadm enable apcupsd
