#!/bin/bash

# Nama image yang akan dibuat
image_name="item-app"
image_tag="v1"
dockerhub_username="irsya05"  # Ganti dengan nama pengguna Docker Hub 

# 1. Perintah untuk membuat Docker image dari Dockerfile
docker build -t $image_name:$image_tag .

# 2. Melihat daftar image di lokal
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
docker tag $image_name:$image_tag $dockerhub_username/$image_name:$image_tag

# 4. Login ke Docker Hub
# Menggunakan perintah 'echo' untuk mengambil nilai dari variabel PASSWORD_DOCKER_HUB dan mengirimkannya sebagai masukan ke perintah 'docker login'.
# -u $dockerhub_username digunakan untuk mengatur nama pengguna Docker Hub dari variabel 'dockerhub_username'.
# --password-stdin menginstruksikan Docker untuk membaca kata sandi dari masukan standar (stdin).
echo $PASSWORD_DOCKER_HUB | docker login -u $dockerhub_username --password-stdin

# 5. Mengunggah image ke Docker Hub
docker push $dockerhub_username/$image_name:$image_tag

# 6. Selesai
echo "Docker image berhasil dibuat."
