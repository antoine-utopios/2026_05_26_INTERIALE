## ETAPE 1: COMPILATION APPLICATION
FROM node:alpine AS builder

# Création d'un dossier de travail et utilisation de ce dossier comme emplacement de base pour toutes les commandes suivantes
WORKDIR /src

# Copie de l'emplacement actuel du Dockerfile, tous les fichiers voisins, vers, dans le conteneur, l'emplacement de référence
COPY package*.json .

# Installation des dépendances
RUN npm install

# Copie de tous les autres fichiers de l'applicatif
COPY . .

# Compiler l'application en une version site web classique
RUN npm run build 

## ETAPE 2: DEPLOIEMENT NGINX
# Pour choisir l'image de base servant à la création de notre propre image...
FROM nginx:alpine 

# Pour copier des fichiers de notre ordinateur à l'image finale...
COPY --from=builder /src/dist /usr/share/nginx/html

# Pour informer de l'importance (pas l'utilisation) future d'un port...
EXPOSE 80

# Pour choisir la commande de lancement de notre conteneur une fois "docker run..."
CMD ["nginx", "-g", "daemon off;"]