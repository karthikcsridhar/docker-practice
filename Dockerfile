FROM keymetrics/pm2:latest-alpine

WORKDIR /src

COPY package.json .
RUN npm i
RUN npm i -g pm2

COPY . .

EXPOSE 3000

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-runtime", "start", "/src/docker_config/ecosystem.config.js" ]