# Exercice Helm #3 - Création de chart Helm

## Objectifs

Appréhender l'écriture et l'utilisation des charts Helm

## Sujet

Ecrire une chart personnalisée Helm permettant, au sein d'un cluster K8s, de réaliser le déploiement de trois applicatifs:
    * Un serveur web contenant un site web personnalisé
    * Une API
    * Le jeu 2048

La chart devra permettre de choisir:
    * L'emplacement de déploiement de chacun des applicatifs
    * La version de nginx
    * Le nombre de replicas pour chaque applicatif de façon indépendante
