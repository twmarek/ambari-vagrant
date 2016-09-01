#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop

cp /vagrant/ambari.repo /etc/yum.repos.d
yum install ambari-agent -y
sed -i.bak "/^hostname/ s/.*/hostname=c6401.ambari.apache.org/" /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start
