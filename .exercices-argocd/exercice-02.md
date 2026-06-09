# Exercice ArgoCD #2 - Récupération d'une chart Helm

## Objectifs

Appréhender le déploiement automatisé des charts Helm via ArgoCD

## Sujet

Créer un dépot Git synchronisé avec une `Application` ArgoCD qui contiendra les applicatifs suivants au sein d'une chart Helm:
    * Un serveur web contenant un site web personnalisé
    * Une API
    * Le jeu 2048

Le déploiement au sein du cluster K8s devra:
    * Suivre les évolutions des fichiers dans le dépot Git de façon automatisée
    * Ne pas être sensible aux changements externes
    * Supprimer les ressources orphelines automatisquement

La chart devra permettre de choisir:
    * L'emplacement de déploiement de chacun des applicatifs
    * La version de nginx
    * Le nombre de replicas pour chaque applicatif de façon indépendante
