FROM node:0.12

RUN npm install

EXPOSE  8080

CMD ["pubot/bin/hubot", "--adapter", "slack"]