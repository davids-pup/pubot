FROM node:0.12

RUN mkdir /pubot
WORKDIR /pubot

WORKDIR /pubot
RUN git clone https://github.com/PageUpPeopleOrg/pubot .
RUN npm install

CMD ["/pubot/bin/hubot", "--adapter", "slack"]