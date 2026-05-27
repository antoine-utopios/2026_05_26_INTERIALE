# Exercice Kubernetes #1 - Réalisation d'un déploiement de base

## Sujet 

Réaliser, via minikube ainsi que l'interface en ligne de commande kubectl, un déploiement de la page d'accueil par défaut de NGINX

* Créer un cluster

```bash
minikube start --driver=Docker
```

* Se connecter au cluster


* Déployer un pod de l'application NGINX avec le tag `alpine`

```bash
docker pull nginx:alpine

minikube image load nginx:alpine

kubectl run exo-01 --image=nginx:alpine --image-pull-policy=Never
# ou
kubectl run exo-01 --image=nginx:alpine --image-pull-policy=IfNotPresent
```

* Créer un service Kubernetes permettant d'exposer le déploiement au sein du cluster

```bash
kubectl expose pod/exo-01 --port=80 --type=LoadBalancer
```

* Créer un tunnel via minikube permettant d'accéder à notre service depuis l'ordinateur hôte

```bash
minikube service exo-01
```