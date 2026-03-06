#!/bin/bash

apk update -y
#apk upgrade -y
apk add --no-cache curl bash openrc
#cp /home/vagrant/vagrant_data/id_rsa /home/vagrant/.ssh/id_rsa
#cat /home/vagrant/vagrant_data/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
#chown -R vagrant:vagrant /home/vagrant/.ssh
until curl -k https://192.168.56.110:6443; do sleep 1; done
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 INSTALL_K3S_EXEC="agent --node-ip=192.168.56.111" K3S_TOKEN="$(cat /home/vagrant/vagrant_data/token)" sh -s
rc-update add k3s-agent default
/etc/init.d/k3s-agent start
sudo systemctl start k3s-agent