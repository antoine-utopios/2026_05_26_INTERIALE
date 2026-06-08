# Exercice Git #1 - Correction de mauvaises pratiques

## Objectif

Appréhender les commits et leur utilisation dans un contexte de dépot local Git

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
git add website/contact.html
git add website/about.html

git commit -m "Ajout contact.html & about.html"
```
* Oops! On s'est trompé et l'on aimerait corriger cela. Faire en sorte de rendre l'ensemble de nos commits plus granulaires

```bash
git reset HEAD~1

git add website/about.html

git commit -m "Ajout about.html"

git add website/contact.html

git commit -m "Ajout contact.html"
```

* Vérifier l'historique des commits Git

```bash
git log
```