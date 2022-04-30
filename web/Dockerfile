FROM node:14.18.0-alpine as build

WORKDIR /src

COPY package*.json ./

RUN npm install --verbose
COPY . .
RUN npm run build

FROM nginx:alpine

COPY --from=build /src/build /usr/share/nginx/html
COPY nginx-default.conf.template /tmp/nginx-default.conf.template
COPY docker-entrypoint.sh /

# ENV WAS_SERVER_HOST="localhost" from Runtime

# Make entrypoint.sh as executable
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

