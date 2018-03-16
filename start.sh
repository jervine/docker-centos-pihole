#!/bin/bash
##
## Start up script for pi-hole on CentOS docker container
##

## Initialise any variables being called:
# Set the correct timezone
TZ=${TZ:-UTC}
setup=/config/.setup

if [ ! -f "${setup}" ]; then
  rm -f /etc/localtime
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  cd /tmp
  chmod 755 docker-install.sh
  /tmp/docker-install.sh
  sed -i -e 's/#user=/user=root/g' /etc/dnsmasq.conf
  touch $setup
fi

touch /var/log/pihole-FTL.log /run/pihole-FTL.pid /run/pihole-FTL.port /var/log/pihole.log
mkdir -p /var/run/pihole
mkdir -p /var/log/pihole
chown pihole:pihole /var/run/pihole /var/log/pihole
rm /var/run/pihole/FTL.sock
chown pihole:pihole /var/log/pihole-FTL.log /run/pihole-FTL.pid /run/pihole-FTL.port /etc/pihole
chmod 0644 /var/log/pihole-FTL.log /run/pihole-FTL.pid /run/pihole-FTL.port /var/log/pihole.log

## Start up pi-hole daemon via supervisord
/usr/bin/supervisord -n -c /etc/supervisord.conf
