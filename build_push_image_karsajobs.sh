#!/bin/bash

# Membangun Docker image dengan tag "irsya05/karsajobs:latest" 
docker build -t irsya05/karsajobs:latest .

# Menampilkan daftar Docker images lokal
docker images

# Menggunakan variabel PASSWORD_DOCKER_HUB untuk login ke Docker Hub
# Password disediakan melalui variabel dan dibaca oleh docker login menggunakan stdin
echo $PASSWORD_DOCKER_HUB | docker login -u irsya05 --password-stdin

# Mengunggah Docker image yang telah dibangun secara lokal ke Docker Hub dengan tag "irsya05/karsajobs:latest"
docker push irsya05/karsajobs:latest

# Menampilkan pesan keberhasilan
echo "Docker image berhasil dibuat dan diunggah ke Docker Hub"
