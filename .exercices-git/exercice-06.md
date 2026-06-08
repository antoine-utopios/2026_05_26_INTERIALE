# Exercice Git #6 - Utilisation de Merge pour mettre à jour une branche et résoudre les conflits

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
* Créer un fichier pour une page 'A propos' et y mettre un texte du style `Texte A`

```bash
echo "Texte A" > website/about.html
```

* Sauvegarder les changements sur Git

```bash
git add . && git commit -m "Ajout du fichier depuis feat/about"
```
* Créer une branche `feat/api`

```bash
git branch feat/about master
```
* Créer une partie **backend** avec un potentiel fichier d'API
* Créer le fichier de la page 'A propos' et y mettre un texte du style `Texte B`
```bash
echo "Texte B" > website/about.html
```

* Sauvegarder le changement sur Git

```bash
git add . && git commit -m "Ajout du fichier depuis feat/api"
```
* Dans la branche principale, ramener les changements des deux branches de feature

```bash
git switch master

git merge feat/about

git merge feat/api # Génération d'un conflit
```
* Résoudre les conflits via un commit de résolution de conflits

```bash
nano website/about.html

git commit -am "Résolution du conflit"
```
* Vérifier l'historique des deux branches

```bash
git log
```