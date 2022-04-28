FROM node:14.18.0-alpine
WORKDIR /src
COPY package*.json ./

RUN npm install
RUN npm ci --only=production
COPY . .

ENV WAS_PORT=8080
ENV WEB_SERVER_HOST="*"

# ENV POSTGRES_HOST="localhost" from Runtime
ENV POSTGRES_PORT=5432
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="password"
ENV POSTGRES_DB="3tier"

EXPOSE ${WAS_PORT}
CMD [ "npm", "start" ]