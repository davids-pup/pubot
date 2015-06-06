FROM node:0.12

ENV DOCKER_USER_GROUP dockeruser
ENV DOCKER_USER dockeruser
ENV DOCKER_USER_HOME /home/dockeruser
ENV PUBOT_DIR /home/dockeruser/pubot

RUN mkdir -p $PUBOT_DIR

WORKDIR /home/dockeruser/pubot

RUN groupadd -r $DOCKER_USER_GROUP -g 401 && \
useradd -u 402 -r -g $DOCKER_USER_GROUP -d $DOCKER_USER_HOME -s /sbin/nologin -c "docker user" $DOCKER_USER && \
chown -R $DOCKER_USER:$DOCKER_USER_GROUP $DOCKER_USER_HOME

user dockeruser

RUN git clone https://github.com/PageUpPeopleOrg/pubot .
RUN npm install

EXPOSE  8080

CMD ["/home/dockeruser/pubot/bin/hubot", "--adapter", "slack"]