### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /usr/src/app/dist/kanban-ui /usr/share/nginx/html
RUN chmod -R 770 /var/cache/nginx /var/run /var/log/nginx
#RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
#RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
EXPOSE 8081