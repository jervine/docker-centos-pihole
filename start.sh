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
  sed -i -e 's/#user=/user=root/g' /etc/dnsmasq.conf
  touch $setup
fi

## Start up pi-hole daemon via supervisord
/usr/bin/supervisord -n -c /etc/supervisord.conf
