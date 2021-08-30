FROM node:alpine3.14

# Create App Directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install software 
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

ARG GIT_PROJECT
RUN git clone ${GIT_PROJECT} .

ARG FOLDER
WORKDIR /usr/src/app/${FOLDER}
RUN npm ci
RUN npm run build

# Exports
EXPOSE 80

CMD npm start
