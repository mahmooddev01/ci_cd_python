# Utiliser une image Python officielle
FROM python:3.10-slim

# Copier le code dans le conteneur
WORKDIR /app
COPY . /app

# Commande de lancement
CMD ["python", "app.py"]
