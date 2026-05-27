## ETAPE 1: COMPILATION APPLICATION
FROM node:alpine

# Création d'un dossier de travail et utilisation de ce dossier comme emplacement de base pour toutes les commandes suivantes
WORKDIR /src

# Copie de l'emplacement actuel du Dockerfile, tous les fichiers voisins, vers, dans le conteneur, l'emplacement de référence
COPY package*.json .

# Installation des dépendances
RUN npm install

# Copie de tous les autres fichiers de l'applicatif
COPY . .

# Lancer l'applicatif en version dev
CMD ["npm", "run", "dev"]