FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
RUN chmod -R 777 /usr/share/nginx/html
COPY --from=builder /app /usr/share/nginx/html
