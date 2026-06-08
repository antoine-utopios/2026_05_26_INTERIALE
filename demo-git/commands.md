# Commandes de base de Git

* Générer un dépot local 

```bash
git init
```

* Configurer nootre identité

```bash
git config --global user.name "Nom"
git config --global user.email "email@example.com"
```

* Ajouter des fichiers dans la Staging Area 

```bash
git add <fichier-a-sauvegarder>

git add <emplacement-a-synchroniser> # Va respecter les chemins présents dans un fichier '.gitignore'
```

* Ajouter le contenu de la staging area à notre dépot

```bash
git commit # Va demander le contenu du commit
git commit -m "Contenu du message" 
git commit -am "Contenu du message" # Sauvegarde aussi les modifications directement des fichiers trackés
```

* Voir les changements des fichiers par rapport à la Staging Area

```bash
git status
```

* Synchroniser le WD / la SA avec un commit

```bash
git reset --soft <id-commit> # Va conserver la staging area (dans le but de commiter cela ailleurs, autre branche par exemple)
git reset --mixed <id-commit> # Besoin de refaire le placement des changements locaux dans la staging area (Permet de compartimenter les changement et de faire des commits plus granulaires)
git reset --hard <id-commit> # Transforme le WD de sorte à ce qu'il corresponde à ce qui est présent dans le commit
```

* Créer des branches

```bash
git branch "nouvelle/branche"
```


* Supprimer des branches

```bash
git branch -d "nom/branche"

git branch -D "nom/branche" # Suppression forcée
```

* Passer à une autre branche

```bash
git checkout nom/branche
git switch nom/branche

# Avec création si non existante de base...
git checkout -b nouvelle/branche
git switch -c nouvelle/branche
```

* Récupérer des changements d'une autre branche (via merge et création d'un commit de merge)

```bash
git switch branche-voulant-changements

git merge branche-contenant-changements --no-ff
```

* Récupérer des changements d'une autre branche (via merge et sans création d'un commit de merge)

```bash
git switch branche-voulant-changements

git merge branche-contenant-changements --ff-only
```

* Récupérer des changements d'une autre branche (via rebase)

```bash
git switch branche-voulant-changements

git rebase branche-contenant-changements
```

* Cloner un dépot distant en local 

```bash
git clone <url-distant> [nom-dossier-local]
```

* Ajouter un lien vers un dépot distant dans un git déjà existant 

```bash
git remote add <nom-remote> <url>
```

* Pousser le contenu d'une branche locale en ligne

```bash
git push <remote> <branche>

git push -u <remote> <branche> # Ajoute le tracking
git push # Si branche actuelle déjà traquée et un seul remote
```

---

Pour pratiquer : [Git branch Learning](https://learngitbranching.js.org/)