# Exercice Kubernetes #4 - Réalisation d'un déploiement mise à jour

## Sujet 

Réaliser, via minikube ainsi que l'interface en ligne de commande kubectl, un déploiement d'un applicatif personnel. Il pourra s'agir par exemple d'une API réalisée avec Express. Cet applicatif sera mis à jour par la suite de sorte à tester le mécanisme des rollouts de K8s.

* Créer l'image de notre applicatif

```bash
docker build -t exercice-04 .
```

* Héberger notre image dans un registre d'image de conteneur public

```bash
docker tag exercice-04 username/exercice-04

# On va répéter le token de connexion à Dockerhub dans le terminal via la commande echo, qui va être envoyée en entrée standard de la commande suivante via le mécanisme du piping et le drapeau --password-stdin
echo $DOCKER_TOKEN | docker login -u username --password-stdin

docker push username/exercice-04
```

* Créer un cluster

```bash
minikube start --driver=Docker
```

* Se connecter au cluster

* Déployer un pod de l'application via son image publique

```bash
minikube image load username/exercice-04

kubectl run exo-04 --image=username/exercice-04 --image-pull-policy=Never
# ou
kubectl run exo-04 --image=username/exercice-04 --image-pull-policy=IfNotPresent
```

* Créer un service Kubernetes permettant d'exposer le pod au sein du cluster

```bash
kubectl expose pod/exo-04 --port=3000 --type=LoadBalancer
```

* Créer un tunnel via minikube permettant d'accéder à notre service depuis l'ordinateur hôte

```bash
minikube service exo-04
```

* Tester le fonctionnement de notre applicatif via un client REST

```bash
curl -v http://localhost:31500/api/v1/hello
```