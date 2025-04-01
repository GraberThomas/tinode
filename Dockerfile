
# Utilisation d'une image Node.js légère
FROM node:20-alpine  

# Définir le répertoire de travail
WORKDIR /app  

# Copier les fichiers nécessaires
COPY package.json package-lock.json ./  

# Installer les dépendances
RUN npm install  

# Copier tout le code
COPY . .  

# Exposer le port 3000
EXPOSE 3000  

# Lancer l'application
CMD ["npm", "start"]

