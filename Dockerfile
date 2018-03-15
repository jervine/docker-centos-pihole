# Base on latest CentOS image
FROM centos:latest

MAINTAINER “Jon Ervine” <jon.ervine@gmail.com>
ENV container docker

# Install updates and some dev tools
RUN yum update -y; yum clean all
RUN yum install -y dialog git iproute net-tools newt procps-ng bc bind-utils cronie curl dnsmasq findutils nmap-ncat sudo unzip wget libidn2 psmisc lighttpd lighttpd-fastcgi php php-common php-cli php-pdo epel-release
