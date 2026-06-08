# Exercice Git #4 - Utilisation de Merge pour mettre à jour une branche 

## Objectif

Appréhender les branches ainsi que les merge dans un contexte de dépot local Git

## Sujet

Réaliser le scénario suivant via les commandes Git: 


* Créer un dépot local

```bash
git init
```

* Créer un fichier `README.md` et le commiter

```bash
echo "Hello world" > README.md

git add . && git commit -m "Initial commit"
```

* Créer un dossier contenant un site web fictif avec un fichier de page d'accueil (`index.html`)

```bash
mkdir website

echo "<h1>Hello world</h1>" > website/index.html
```

* Sauvegarder ces changements sur Git

```bash
git add . && git commit -m "Ajout du fichier de la page d'accueil"
```

* Créer une branche `feat/about`

```bash
git branch feat/about
```

* Créer un fichier pour une page 'A propos'

```bash
echo "<h1>Hello world</h1>" > website/about.html
```

* Sauvegarder les changements sur Git

```bash
git add . && git commit -m "Ajout du fichier de la page d'à propos"
```

* Créer une branche `feat/api`

```bash
git branch feat/api
```

* Créer une partie **backend** avec un potentiel fichier d'API

```bash
mkdir backend

echo "console.log('Je suis une API')" > backend/api.js
```


* Sauvegarder le changement sur Git

```bash
git add . && git commit -m "Ajout du fichier de l'API"
```


* Dans la branche principale, ramener les changements des deux branches de feature

```bash
git switch master

git merge feat/about
git merge feat/api
```

* Vérifier l'historique des deux branches et observer leurs différences spécifiques

```bash
git log
```
