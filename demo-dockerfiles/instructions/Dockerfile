# On part d'une image de base pour la suite
FROM blabla

# On part d'une image de base pour la suite de l'étape alias "XXX"
FROM blabla AS XXX

# On fixe un dossier (qui sera créé si non existant) pour la suite des opérations 
WORKDIR /emplacement/dans/conteneur

# Copie de fichiers de l'hôte vers le conteneur servant à créer l'image
COPY /emplacement/hote /emplacement/conteneur

# Copie de fichiers d'une étape précédente vers le conteneur servant à créer l'image
COPY --from=builder /emplacement/hote /emplacement/conteneur

# Copie de fichiers (désarchivage automatique) de l'hôte vers le conteneur
ADD /emplacement/hote /emplacement/conteneur

# Exécution de commandes en cours de build de l'image
RUN command subcommand

# Création et utilisation d'un utilisateur pour la suite des instructions
USER blabla

# Création et utilisation d'une variable disponible dés la compilation de l'image<
ARG VARIABLE_NAME default_value

# Création et utilisation d'une variable disponible lors du lancement du conteneur Docker
ENV VARIABLE_NAME default_value

# A titre informatif, le conteneur futur va utiliser tel port
EXPOSE 8080 

# Commande de lancement du conteneur (complétée) une fois la commande "docker run..." utilisée
ENTRYPOINT ["debut", "de", "commande"]

# Commande de lancement du conteneur une fois la commande "docker run..." utilisée
CMD ["command", "subcommand", "-flag"]

## EXEMPLE: Node avec scripts

ENTRYPOINT ["node"]

CMD ["helloworld.js"]