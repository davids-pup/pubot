FROM node:0.12

COPY . /src

RUN cd /src; npm install

EXPOSE  8080

CMD ["/src/node_modules/.bin/hubot", "--adapter", "slack"]