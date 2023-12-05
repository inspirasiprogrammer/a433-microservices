#!/bin/bash

# Nama image yang akan dibuat
image_name="karsajobs-ui"
image_tag="latest"
ghcr_username="inspirasiprogrammer"  
ghcr_repository="a433-microservices"  

#deklarasi nama image kedalam variabel
image = $ghcr_username/$ghcr_repository/$image_name:$image_tag

# 1. Perintah untuk membuat Docker image dari Dockerfile
docker build -t $image_name:$image_tag .

# 2. Melihat daftar image di lokal
docker images

# 3. Mengubah nama image agar sesuai dengan format Github Packages
docker tag $image_name:$image_tag ghcr.io/$image .

# 4. Login ke Github Packages
# Menggunakan perintah 'echo' untuk mengambil nilai dari variabel GITHUB_TOKEN dan mengirimkannya sebagai masukan ke perintah 'docker login'.
# -u $ghcr_username digunakan untuk mengatur nama pengguna Github Packages dari variabel 'ghcr_username'.
# --password-stdin menginstruksikan Docker untuk membaca kata sandi dari masukan standar (stdin).
echo $GITHUB_TOKEN | docker login ghcr.io -u $ghcr_username --password-stdin

# 5. Mengunggah image ke GitHub Container Registry
docker push ghcr.io/$image

# 6. Selesai
echo "Docker image berhasil dibuat dan diunggah ke GitHub Container Registry."
