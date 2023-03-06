### STAGE 1: Build ###
FROM node:12.7-alpine AS build
#FROM node:19.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
#FROM nginx:1.17.1-alpine
#FROM nginx:alpine
#FROM nginxinc/nginx-unprivileged
#FROM nginxinc/nginx-unprivileged:1.12.6-alpine
FROM nginxinc/nginx-unprivileged:1.21.6-alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /usr/src/app/dist/kanban-ui /usr/share/nginx/html
