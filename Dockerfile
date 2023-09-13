#Base image yang digunakan (nodejs versi 14)
FROM node:14
#Direktori default pada container (/app)
WORKDIR /app
#Copy semua source code dari repository ke image
COPY . /app/
#Setting Environment pada image (Menautkan container item-db untuk database host dan berjalan pada mode production)
ENV NODE_ENV=production DB_HOST=item-db
#Intallasi dari dependency yang untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build
#Ekspose port yang akan diunakan oleh aplikasi
EXPOSE 8080
#Command untuk memulai npm saat container dijalankan
CMD ["npm", "start"]