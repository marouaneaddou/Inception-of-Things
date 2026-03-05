
kubectl apply -f /home/vagrant/deploy/confs/apps/app1/deployment.yaml \
    -f /home/vagrant/deploy/confs/apps/app1/service.yaml \
    -f /home/vagrant/deploy/confs/apps/app2/deployment.yaml \
    -f /home/vagrant/deploy/confs/apps/app2/service.yaml \
    -f /home/vagrant/deploy/confs/apps/app3/deployment.yaml \
    -f /home/vagrant/deploy/confs/apps/app3/service.yaml \
    -f /home/vagrant/deploy/confs/ingress.yaml