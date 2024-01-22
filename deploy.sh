#!/bin/bash

DOCKER_IMAGE="gustavo/desafio-kubernetes"
DOCKER_TAG="1.0"
ENVIROMENT="development"

cd app/
docker build -t $DOCKER_IMAGE:$DOCKER_TAG .

cd ..
minikube start
eval $(minikube docker-env)
kubectl config use-context minikube

docker tag $DOCKER_IMAGE:$DOCKER_TAG $DOCKER_IMAGE:minikube
docker image save $DOCKER_IMAGE:minikube | (eval $(minikube docker-env) && docker image load)

# Deploy namespaces
kubectl apply -f namespaces/

# Install Helm Chart
helm install myapp ./kubernetes/charts/myapp -n $ENVIROMENT -f ./kubernetes/charts/myapp/values.yaml

kubectl rollout status deployment myapp-deployment

curl myapp.local
