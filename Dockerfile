# Menggunakan image Node.js dengan tag 14-alpine sebagai dasar
FROM node:14-alpine

# Membuat direktori "app" dan mengubah direktori kerja saat ini ke dalamnya
WORKDIR /app

# Menyalin file package.json dari direktori kerja saat ini ke dalam kontainer di direktori /app
COPY package.json .

# Menambahkan file index.js dari direktori kerja saat ini ke dalam kontainer di direktori /app
ADD index.js .

# Menetapkan variabel lingkungan untuk port aplikasi dan host RabbitMQ
ENV PORT=3001 AMQP_URL=amqp://localhost:5672

# Menginstall paket-paket yang diperlukan untuk aplikasi menggunakan npm
RUN npm install

# Menjalankan aplikasi dengan perintah "npm run start" saat kontainer dimulai
CMD ["npm", "run", "start"]

# Menerbitkan port 3001 untuk aplikasi yang berjalan di dalam kontainer
EXPOSE 3001
