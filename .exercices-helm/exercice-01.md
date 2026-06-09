# Exercice Helm #1 - Réaliser un déploiement de WordPress

## Objectifs

Appréhender les déploiement K8s via l'utilisation de Helm

## Sujet

En utilisant un cluster de type `minikube` ainsi que les commandes `helm`, réaliser le déploiement d'un Wordpress local:

* Le déploiement doit avoir lieu dans son propre namespace
* Le déploiement doit posséder un mot de passe personnalisé
    * Pour l'interface administrateur
    * Pour la base de données MariaDB

Vérifier ensuite le déploiement via un accès en ligne à `https://localhost:8080`