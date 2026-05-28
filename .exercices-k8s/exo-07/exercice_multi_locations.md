# Exercice Kubernetes #7 - Réalisation d'un déploiement d'applicatifs sur plusieurs nodes différentes

## Sujet 

Réaliser, via kind ainsi l'approche déclarative de K8s, un déploiement d'applicatifs différents sur différents emplacements du monde: 

```bash
kubectl taint nodes exo-07-worker country=france:NoExecute && \
kubectl taint nodes exo-07-worker2 country=japan:NoExecute && \
kubectl taint nodes exo-07-worker3 country=usa:NoExecute && \
kubectl label nodes exo-07-worker country=france && \
kubectl label nodes exo-07-worker2 country=japan && \
kubectl label nodes exo-07-worker3 country=usa
```

* Déployer un serveur web de type NGINX sur un emplacement 'France'
* Déployer une api réalisée avec Express sur un emplacement 'Japon'
* Déployer le jeu 2048 sur un emplacement 'USA'

```bash
kubectl port-forward svc/exo-07-nginx 80
curl http://localhost/

kubectl port-forward svc/exo-07-2048 80:8080
curl http://localhost/

kubectl port-forward svc/exo-07-2048 80:3000
curl http://localhost/api/v1/hello
```