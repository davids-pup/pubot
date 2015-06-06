FROM node:0.12

RUN mkdir /pubot
WORKDIR /pubot

RUN git clone https://github.com/PageUpPeopleOrg/pubot .
RUN npm install

EXPOSE  8080

CMD ["/pubot/bin/hubot", "--adapter", "slack"]