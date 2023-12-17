#!/bin/bash

# Langkah 1: Membangun image dengan nama "shipping" dan memberikan tag "latest"
docker build -t shipping:latest .

# Langkah 2: Mengganti nama repositori lokal menjadi sesuai dengan format GitHub Container Registry
docker tag shipping:latest ghcr.io/inspirasiprogrammer/shipping:latest

# Langkah 3: Login ke GitHub Container Registry menggunakan password yang disediakan
echo $PASSWORD_GITHUB | docker login ghcr.io -u inspirasiprogrammer --password-stdin

# Langkah 4: Mengirim image ke GitHub Container Registry
docker push ghcr.io/inspirasiprogrammer/shipping:latest
