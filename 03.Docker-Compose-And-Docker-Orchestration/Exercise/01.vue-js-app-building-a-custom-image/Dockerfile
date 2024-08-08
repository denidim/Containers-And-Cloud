FROM node:20

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 8080

ENTRYPOINT [ "npm", "run", "dev" ]