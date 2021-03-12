#!/usr/bin/env bash
apt-get -y update
apt-get -y install haproxy
mv /etc/haproxy/haproxy.cfg{,.original}

sed -i -e 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy
ln -s /vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg
service haproxy start