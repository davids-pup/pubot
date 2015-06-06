FROM node:0.12

ENV DOCKER_USER_GROUP dockerusergroup
ENV DOCKER_USER dockeruser
ENV DOCKER_USER_HOME /home/dockeruser
ENV PUBOT_DIR /home/dockeruser/pubot

RUN mkdir -p $DOCKER_USER_HOME
RUN mkdir $PUBOT_DIR

WORKDIR $PUBOT_DIR

RUN groupadd -r $DOCKER_USER_GROUP -g 401 && \
useradd -u 402 -r -g $DOCKER_USER_GROUP -d $DOCKER_USER_HOME -s /sbin/nologin -c "docker user" $DOCKER_USER && \
chown -R $DOCKER_USER:$DOCKER_USER_GROUP $DOCKER_USER_HOME

user $DOCKER_USER

RUN git clone https://github.com/PageUpPeopleOrg/pubot .
RUN npm install

EXPOSE  8080

CMD ["/pubot/bin/hubot", "--adapter", "slack"]