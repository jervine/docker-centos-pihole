# docker-centos-pihole
## CentOS 7.4 hosted pi-hole server
### Build Version: 1
Date of Build: 16th March 2018

This docker image creates a latest CentOS docker container running the Pi-Hole DNS blackhole/ad-blocker. You should supply an environment variable 'TZ' when the container is first run to set the correct timezone in /etc/php.ini - otherwise a default timezone of UTC is used:

    docker run -d --network=<optional network> --name <optional container name> -h <optional hostname> -e TZ="Europe/London" -v /docker/config/pihole:/config -p 53:53 -p 53:53/udp -p 80:80 -p 9010:9010 jervine/docker-centos-pihole

The start.sh script checks for the existence of /config/.setup to determine whether to run through the setup process each time the container is run. The initial setup should execute the /tmp/docker-install.sh script which will install the necessary components for Pi-Hole to run. If /config is not mapped to a local directory then /config/.setup will be absent every time the container is ran (it will be present if the container is simply stopped and started though).

When first spun up, the web interface can be configured via http://\<docker host\>/admin
