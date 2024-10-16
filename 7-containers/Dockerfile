# Adapted from https://gitlab.com/twn-devops-bootcamp/latest/07-docker/js-app/-/blob/master/Dockerfile?ref_type=heads

FROM node:20-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# using Docker best practices with npm install only running on changed package.json
# and then COPY command for frequently changing code
COPY package.json package-lock.json

# will execute npm install in /home/app because of WORKDIR
RUN npm install

COPY ./app /home/app

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

