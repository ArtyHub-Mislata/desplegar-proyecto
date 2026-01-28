FROM node:22.19.0 AS build

RUN apt-get install -y git

WORKDIR /opt/app
RUN git clone https://github.com/ArtyHub-Mislata/tienda-adm-front.git
WORKDIR /opt/app/tienda-adm-front
RUN git switch --detach origin/develop
RUN npm ci --legacy-peer-deps
RUN npm run build --prod

FROM nginx:1.28.0-alpine3.21
COPY --from=build /opt/app/tienda-adm-front/dist/tienda-adm-front/browser/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
