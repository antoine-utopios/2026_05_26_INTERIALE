# Exercice Kubernetes #3 - Réalisation d'un déploiement multiple

## Sujet 

Réaliser, via minikube ainsi que l'interface en ligne de commande kubectl, un déploiement d'un site web personnalisé. Le site web devra posséder idéalement plusieurs pages, un fichier de CSS ainsi qu'une page d'accueil porteuse du titre `Exercice 03 terminé!` mis en valeur via du CSS.

* Créer l'image de notre applicatif

```bash
docker build -t exercice-03 .
```

* Héberger notre image dans un registre d'image de conteneur public

```bash
docker tag exercice-03 username/exercice-03

# On va répéter le token de connexion à Dockerhub dans le terminal via la commande echo, qui va être envoyée en entrée standard de la commande suivante via le mécanisme du piping et le drapeau --password-stdin
echo $DOCKER_TOKEN | docker login -u username --password-stdin

docker push username/exercice-03
```

* Créer un cluster

```bash
minikube start --driver=Docker
```

* Se connecter au cluster

* Déployer un pod de l'application via son image publique

```bash
minikube image load username/exercice-03

kubectl run exo-03 --image=username/exercice-03 --image-pull-policy=Never
# ou
kubectl run exo-03 --image=username/exercice-03 --image-pull-policy=IfNotPresent
```

* Créer un service Kubernetes permettant d'exposer le pod au sein du cluster

```bash
kubectl expose pod/exo-03 --port=8080 --type=LoadBalancer
```

* Créer un tunnel via minikube permettant d'accéder à notre service depuis l'ordinateur hôte

```bash
minikube service exo-03
```