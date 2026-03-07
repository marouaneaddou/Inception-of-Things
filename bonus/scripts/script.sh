if ! grep -q "gitlab.gitlab.local" /etc/hosts; then
    echo "127.0.0.1 gitlab.gitlab.local" | sudo tee -a /etc/hosts
fi


k3d cluster create mycluster -p 8080:80@loadbalancer -p "8888:80@loadbalancer"
#installation helm

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh

#gitlab installation
helm repo add gitlab http://charts.gitlab.io/
helm repo update
helm install gitlab gitlab/gitlab -n gitlab --create-namespace -f ../confs/gitlab-values.yaml --timeout 600s

kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath="{.data.password}" | base64 --decode

#./argocd-config.sh