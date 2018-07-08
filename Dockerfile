FROM mhart/alpine-node

WORKDIR /src

COPY package.json .
RUN npm i
RUN npm i -g pm2

COPY . .

EXPOSE 3000

CMD ["pm2", "start", "./docker_config/ecosystem.config.js"]
