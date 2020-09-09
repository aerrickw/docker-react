FROM node:alpine as Build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx as Run
EXPOSE 80
COPY --from=Build /app/build /usr/share/nginx/html