FROM node:14

WORKDIR /usr/app

COPY package*.json ./

RUN npm install

COPY  . .

EXPOSE 7001

RUN npx tsc

CMD [ "npm", "start" ]
