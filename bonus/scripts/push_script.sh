#!/bin/bash

git clone https://github.com/marouaneaddou/maddou-myapp-gitops.git appfiles

git clone http://gitlab.gitlab.local:8080/root/app.git apps

cp ./appfiles/deployment.yaml ./apps/
cp ./appfiles/ingress.yaml ./apps/
cp ./appfiles/service.yaml ./apps/

cd apps
git add .
git commit -m "add app files"
git push
