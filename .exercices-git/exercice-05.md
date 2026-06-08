# Exercice Git #4 - Utilisation de Rebase pour mettre à jour une branche 

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

* Créer une branche `feat/contact`

```bash
git branch feat/contact
```

* Créer une branche `feat/api`

```bash
git branch feat/api
```

* Dans `feat/contact`, créer un fichier pour une page 'Contact'

```bash
git switch feat/contact

mkdir website

echo "<h1>Hello world</h1>" > website/contact.html
```

* Sauvegarder les changements sur Git
```bash
git add . && git commit -m "Ajout du fichier de la page de contact"
```

* Dans `feat/api`, créer une partie **backend** avec un potentiel fichier d'API pour traiter la requête HTTP du formulaire de contact
```bash
git switch feat/api

mkdir backend

echo "console.log('Je suis une API')" > backend/api.js
```
* Sauvegarder le changement sur Git

```bash
git add . && git commit -m "Ajout du fichier de l'API"
```

* Dans la branche principale, ramener les changements de la feature d'API via un merge
```bash
git switch master

git merge feat/api
```
* Dans la branche `feat/contact`, récupérer les changements liés à l'API

```bash
git switch feat/contact

git rebase master
```
* Vérifier l'historique des deux branches et observer leurs différences spécifiques (La branche de feature frontend doit avoir l'API mais pas l'inverse)

```bash
git log
```
