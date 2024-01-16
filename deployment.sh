#!/bin/bash

cd app/
docker build -t gustavo/desafio-kubernetes:1.0 .

cd ..
helm install desafio-kubernetes charts/app --values values/deploy-values.yaml --values values/app-values.yaml

minikube service desafio-kubernetes
