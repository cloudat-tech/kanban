### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
#FROM nginx:1.17.1-alpine
FROM nginx:alpine
RUN  touch /var/run/nginx.pid && \
     chown -R nginx:nginx /var/cache/nginx /var/run/nginx.pid
USER nginx
COPY --chown=nginx:nginx default.conf /etc/nginx/conf.d/default.conf
COPY --from=build --chown=nginx:nginx /usr/src/app/dist/kanban-ui /usr/share/nginx/html
EXPOSE 8081