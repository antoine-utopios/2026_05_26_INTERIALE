# Exercice Git #3 - Commit au mauvais endroit

## Objectif

Appréhender les commits et des branches ainsi que leur utilisation dans un contexte de dépot local Git

## Sujet

Réaliser le scénario suivant via les commandes Git: 


* Créer un dépot local

```bash
git init
```

* Créer un dossier contenant un site web fictif avec un fichier de page d'accueil (`index.html`)

```bash
mkdir website

touch website/index.html
```

* Sauvegarder ces changements sur Git

```bash
git add website/index.html

git commit -m "Ajout index.html"
```
* Créer un fichier pour une page de contact ainsi qu'un fichier pour une page 'A propos'

```bash
touch website/contact.html
touch website/about.html
```

* Sauvegarder l'ensemble des changements sur Git

```bash
git add website/about.html

git commit -m "Ajout about.html"

git add website/contact.html

git commit -m "Ajout contact.html"
```
* Créer une partie fictive **backend** (un dossier) et y placer un potentiel fichier d'API

```bash
mkdir backend

touch backend/api.py
```

* Sauvegarder le changement sur Git

```bash
git add backend/api.py

git commit -m "Ajout api.py"
```

* Oops! On vient de polluer la partie frontend avec du code provenant du backend. Corriger cela via les commandes Git

```bash
git reset --soft HEAD~1

git branch backend

git commit -m "Ajout api.py"
```

* Vérifier l'historique des deux branches et observer leurs différences spécifiques

```bash
git log

git switch master

git log
```