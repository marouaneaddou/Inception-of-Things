
#!/bin/bash

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

kubectl create namespace argocd

kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=ready pods --all -n argocd
kubectl apply -f ../confs/argocd-application.yaml

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
