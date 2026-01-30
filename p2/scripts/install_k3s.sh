apt-get update 
apt-get upgrade -y
apt-get install curl -y
mkdir -p /home/vagrant/.kube
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --write-kubeconfig  /home/vagrant/.kube/config --write-kubeconfig-mode=644" sh -s