# Exercice Kubernetes #2 - Réalisation d'un déploiement d'applicatif Java

## Sujet 

Réaliser, via minikube ainsi que l'interface en ligne de commande kubectl, un déploiement de l'application 2048 déservie par un serveur Tomcat (image docker de `quchaonet`)

* Créer un cluster

```bash
minikube start --driver=Docker
```

* Se connecter au cluster

* Déployer un pod de l'application voulue

```bash
docker pull quchaonet/2048

minikube image load quchaonet/2048

kubectl run exo-02 --image=quchaonet/2048 --image-pull-policy=Never
# ou
kubectl run exo-02 --image=quchaonet/2048 --image-pull-policy=IfNotPresent
```

* Créer un service Kubernetes permettant d'exposer le déploiement au sein du cluster

```bash
kubectl expose pod/exo-02 --port=8080 --type=LoadBalancer
```

* Créer un tunnel via minikube permettant d'accéder à notre service depuis l'ordinateur hôte

```bash
minikube service exo-02
```