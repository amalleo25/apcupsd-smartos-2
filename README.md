#Work in progress

# apcupsd-smartos
Install apcupsd on smartos global zone

## Setup zone
Create a new zone using the base image

Run pkgin up

Run pkgin in gmake

cd /tmp

wget http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3.14.14/apcupsd-3.14.14.tar.gz

tar -xvf apcupsd-3.14.14

cd apcupsd-3.14.14

configure ...

make

make install

