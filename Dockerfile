FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# folder generate as /app/build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#default command is start nginx - so no change

