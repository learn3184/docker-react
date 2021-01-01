#BUILD PHASE
FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

#CMD ["npm","run","build"]
RUN npm run build

#RUN PHASE - Start RUN Phase With NGINX

FROM nginx

COPY --from=0  /app/build /usr/share/nginx/html

