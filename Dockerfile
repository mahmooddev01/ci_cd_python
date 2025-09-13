# Utiliser une image Python officielle
FROM python:3.10-slim

# Copier le code dans le conteneur
WORKDIR /app

# Copier et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du code
COPY . .

# Commande de lancement
CMD ["python", "app.py"]
