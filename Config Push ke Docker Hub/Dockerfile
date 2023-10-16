# Menggunakan base image Node.js versi 14 yang ringan
FROM node:14

# Menetapkan direktori kerja saat ini dalam container ke /app
WORKDIR /app

# Menyalin semua kode sumber aplikasi dari direktori host ke direktori kerja dalam container
COPY . .

# Mengatur variabel lingkungan NODE_ENV ke "production" dan DB_HOST ke "item-db"
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Menginstal dependensi yang dibutuhkan untuk mode produksi
# Flag --production hanya menginstal dependensi produksi
# Flag --unsafe-perm digunakan untuk menghindari masalah izin saat menjalankan npm sebagai root
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080 yang digunakan oleh aplikasi
EXPOSE 8080

# Saat container dijalankan, menjalankan server dengan perintah npm start
CMD ["npm", "start"]
