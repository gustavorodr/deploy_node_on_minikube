# deploy_node_on_minikube

Demonstration repository for deploying to minikube with a single-execution script.

## Goal

Within this repository there is a subdirectory **app** and a **Dockerfile** that builds this image, its objective is:

- Build the application's docker image
- Create kubernetes resource manifests to run the application (*deployments, services, tickets, configmap* and anything else you consider necessary)
- Create a *script* to execute *deploy* in a single execution.
- The application must be *deployed* with a single command line on a **local** Kubernetes cluster
- All *pods* must be running
- The application must respond to a specific URL configured in *ingress*

## Extras

- Use Helm [HELM](https://helm.sh/)
- Division of resources by *namespaces*
- Use of *health check* in the application
- Make the application display your name instead of **"Hello, candidate!"**

## Grades

- You can use [Minikube](https://github.com/kubernetes/minikube) or [Docker for Mac/Windows](https://docs.docker.com/docker-for-mac/) to run the challenge and testing.
- The application defaults to *default* using port **3000** and uses an environment variable **$NAME**
- It is not necessary to *upload* the Docker image to a public registry, you can build the image locally and use it directly.

```bash
chmod +x deployment.sh
./deployment.sh
```
