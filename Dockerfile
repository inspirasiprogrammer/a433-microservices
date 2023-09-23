# Gunakan base image Node.js versi 14
FROM node:14

# Set working directory di dalam container
WORKDIR /app

# Menyalin seluruh source code ke working directory di container
COPY . /app

# Menentukan mode produksi dan host database
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Menginstal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080 yang digunakan oleh aplikasi
EXPOSE 8080

# Jalankan server saat container diluncurkan
CMD ["npm", "start"]
