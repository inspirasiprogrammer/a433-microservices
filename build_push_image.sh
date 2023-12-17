#!/bin/bash

# Langkah 1: Membangun image Docker dengan nama "order" dan memberikan tag "latest"
docker build -t order:latest .

# Langkah 2: Mengganti nama repositori lokal Docker sesuai dengan format GitHub Container Registry
docker tag order:latest ghcr.io/inspirasiprogrammer/order:latest

# Langkah 3: Login ke GitHub Container Registry menggunakan password GitHub yang disediakan
echo $PASSWORD_GITHUB | docker login ghcr.io -u inspirasiprogrammer --password-stdin

# Langkah 4: Mendorong image Docker ke GitHub Container Registry
docker push ghcr.io/inspirasiprogrammer/order:latest
