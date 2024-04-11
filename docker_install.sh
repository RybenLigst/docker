#!/bin/bash

# Checking for Docker availability
if command -v docker >/dev/null 2>&1; then
  echo "Docker is already installed!"
  exit 0
fi

# Updating the list of packages
sudo apt-get update

# Installing the necessary packages
sudo apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Adding a Docker key
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Adding a Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Updating the list of packages
sudo apt-get update

# Installing Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Checking the version of Docker
docker version

echo "Docker installed successfully!"
