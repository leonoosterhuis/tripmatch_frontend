FROM node:latest as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build --source-map=false

FROM nginx:latest

COPY --from=build /app/dist/tripmatch_frontend/browser/* /usr/share/nginx/html/

EXPOSE 80

