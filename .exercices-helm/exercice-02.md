# Exercice Helm #2 - Réaliser un déploiement de MySQL

## Objectifs

Appréhender les déploiement K8s via l'utilisation de Helm

## Sujet

En utilisant un cluster de type `minikube` ainsi que les commandes `helm`, réaliser le déploiement d'une base de données locale MySQL:

* Le déploiement doit avoir lieu dans son propre namespace
* Le déploiement doit posséder un mot de passe personnalisé
    * Le mot de passe doit provenir d'un secret présent en amont dans le cluster

 `mysql-root-password`, `mysql-replication-password` and `mysql-passwor

```bash
kubectl create ns exo-02

kubectl create secret generic exo-02-db-secret \
    -n exo-02 \
    --from-literal "'mysql-root-password'=rootPassword"
    --from-literal "'mysql-replication-password'=replicationPassword"
    --from-literal "'mysql-password'=password"


helm install exo-02-release bitnami/mysql \
    --version 14.0.3 \
    --namespace exo-02 \
    --create-namespace \
    --set auth.existingSecret=exo-02-db-secret
```

Vérifier ensuite le déploiement via un accès en local et un client MySQL quelconque type dBeaver ou le CLI MySQL