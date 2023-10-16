#!/bin/bash

# Nama image yang akan dibuat
image_name="item-app"
image_tag="v1"
ghcr_username="inspirasiprogrammer"  # Ganti dengan nama pengguna GitHub Anda
ghcr_repository="a433-microservices"  # Ganti dengan nama repository di GitHub Container Registry Anda

# 1. Perintah untuk membuat Docker image dari Dockerfile
docker build -t $image_name:$image_tag .
# 2. Melihat daftar image di lokal
docker images

# 3. Mengubah nama image agar sesuai dengan format Github Packages
docker tag $image_name:$image_tag ghcr.io/$ghcr_username/$ghcr_repository/$image_name:$image_tag .

# 4. Login ke Github Packages
# Menggunakan perintah 'echo' untuk mengambil nilai dari variabel GITHUB_PACKAGES_TOKEN dan mengirimkannya sebagai masukan ke perintah 'docker login'.
# -u $ghcr_username digunakan untuk mengatur nama pengguna Github Packages dari variabel 'ghcr_username'.
# --password-stdin menginstruksikan Docker untuk membaca kata sandi dari masukan standar (stdin).
echo $GITHUB_PACKAGES_TOKEN | docker login ghcr.io -u $ghcr_username --password-stdin

# 5. Mengunggah image ke GitHub Container Registry
docker push ghcr.io/$ghcr_username/$ghcr_repository/$image_name:$image_tag

# 6. Selesai
echo "Docker image berhasil dibuat dan diunggah ke GitHub Container Registry."
