# SETUP MINIKUBE

### Run docker

```bash
docker-compose up -d
```

### Start minikube

If we got an error that minikube is existing, run delete and then start again
minikube delete

```bash
docker exec -it test-kuber bash

minikube start --driver=docker --force
```

### Command cheat sheet

```bash
kubectl create deployment nginx-depl --image=nginx

kubectl get pod -o wide

kubectl get deployment nginx-depl -o yaml
```
