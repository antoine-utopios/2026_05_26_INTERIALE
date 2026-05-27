# Pour choisir l'image de base servant à la création de notre propre image...
FROM nginx:alpine 

# Pour copier des fichiers de notre ordinateur à l'image finale...
COPY dist /usr/share/nginx/html

# Pour informer de l'importance (pas l'utilisation) future d'un port...
EXPOSE 80

# Pour choisir la commande de lancement de notre conteneur une fois "docker run..."
CMD ["nginx", "-g", "daemon off;"]