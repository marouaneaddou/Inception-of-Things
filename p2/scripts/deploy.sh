
kubectl apply -f /home/vagrant/deploy/apps/app1/deployment.yaml \
    -f /home/vagrant/deploy/apps/app1/service.yaml \
    -f /home/vagrant/deploy/apps/app2/deployment.yaml \
    -f /home/vagrant/deploy/apps/app2/service.yaml \
    -f /home/vagrant/deploy/apps/app3/deployment.yaml \
    -f /home/vagrant/deploy/apps/app3/service.yaml \
    -f /home/vagrant/deploy/ingress.yaml