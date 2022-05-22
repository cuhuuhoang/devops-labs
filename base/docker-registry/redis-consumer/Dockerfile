FROM node:16.15-alpine

WORKDIR /app

COPY . .

RUN npm install && npm install -g pm2 && npm install redis

CMD ["pm2-runtime", "ecosystem.config.js"]
