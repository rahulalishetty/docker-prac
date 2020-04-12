FROM node:alpine as builder 
WORKDIR '/dir'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /dir/build /usr/share/nginx/html

