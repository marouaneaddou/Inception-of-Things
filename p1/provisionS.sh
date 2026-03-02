#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install curl -y
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=192.168.56.110 --write-kubeconfig-mode=644" sh -s
cp /home/vagrant/vagrant_data/id_rsa /home/vagrant/.ssh/id_rsa
cp /var/lib/rancher/k3s/server/node-token /home/vagrant/vagrant_data/token
cat /home/vagrant/vagrant_data/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
