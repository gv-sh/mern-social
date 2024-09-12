#!/bin/bash

# Update package list and install dependencies
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package list again
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add current user to docker group
sudo usermod -aG docker $USER

# Restart Docker service
sudo systemctl restart docker

# Apply group changes without logout
newgrp docker

# Generate SSL certificates
mkdir -p ./ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./ssl/nginx.key -out ./ssl/nginx.crt

# Copy ssl folder to /etc/nginx/ssl
sudo cp -r ./ssl /etc/nginx/ssl

# Copy nginx.conf to /etc/nginx/nginx.conf
sudo cp nginx.conf /etc/nginx/nginx.conf

# Build using Docker Compose
docker-compose up --build

echo "Docker image has been built successfully."

