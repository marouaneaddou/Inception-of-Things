
k3d &> /dev/null
if [[ $? -eq 1 ]]; then
    echo "K3d already installed"
else 
    curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi

k3d cluster create inception-of-things -p "8888:80@server:0"

kubectl create namespace argocd

kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=ready pods --all -n argocd
kubectl apply -f ../application.yaml
kubect apply -f ../argocd/ingress.yaml
