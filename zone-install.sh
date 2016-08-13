#!/bin/bash

PREFIX=/opt/local

pkgin -y up
pkgin -y in gcc49 gmake

#cd /tmp

wget http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3.14.14/apcupsd-3.14.14.tar.gz -P /tmp
tar -xzf apcupsd-3.14.14.tar.gz -C /tmp

cd /tmp/apcupsd-3.14.14

./configure --prefix=$PREFIX --sbindir=$PREFIX/sbin --sysconfdir=$PREFIX/etc/apcupsd --mandir=$PREFIX/man \
--with-log-dir=/var/log --without-lock-dir --with-pwrfail-dir=$PREFIX/etc/apcupsd --disable-cgi --disable-apcsmart \
--disable-dumb --disable-pcnet --disable-modbus --without-cgi-bin --with-nisip=127.0.0.1 --with-upscable=ether --with-upstype=net

make
make install

#mkdir -p /mnt/opt/custom/smf /mnt/opt/local/lib/svc/method /mnt/opt/local/sbin /mnt/opt/local/etc/apcupsd \
#/mnt/opt/local/usr/share/man/man5 /mnt/opt/local/usr/share/man/man8 2>/dev/null

#chgrp sys /mnt/opt/local/sbin
#chgrp sys /mnt/opt/local/etc

cp $PREFIX/sbin/apcupsd /mnt/opt/local/sbin
cp $PREFIX/sbin/apctest /mnt/opt/local/sbin
cp $PREFIX/sbin/apcaccess /mnt/opt/local/sbin
cp $PREFIX/sbin/smtp /mnt/opt/local/sbin
cp $PREFIX/etc/apcupsd/* /mnt/opt/local/etc/apcupsd
cp $PREFIX/man/man5/apcupsd.conf.5 /mnt/opt/local/man/man5
cp $PREFIX/man/man8/apcaccess.8 /mnt/opt/local/man/man8
cp $PREFIX/man/man8/apccontrol.8 /mnt/opt/local/man/man8
cp $PREFIX/man/man8/apctest.8 /mnt/opt/local/man/man8
cp $PREFIX/man/man8/apcupsd.8 /mnt/opt/local/man/man8


#wget http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3.14.14/apcupsd-3.14.14.tar.gz -P /tmp
#tar -xzf /tmp/apcupsd-3.14.14.tar.gz -C /tmp
