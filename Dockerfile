FROM node:0.12

# essentially the idea is to isolate docker layers as much as possible

# 1. coffee-script installing is something that is not dependent on anything in source code
# so, running it in isolation - so that layer can be independently cached by docker
RUN npm install -g coffee-script

# 2. run npm install only based on changes in package.json.
# to acheive it, move the package.json to a tmp location and run npm install there
# and copy the node modules to the source folder.
# that way, this layer can be independently cached by docker
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src

# 3. sepearate layer sets the work dir
WORKDIR /src

# 4. seperate layer that copies the source code
COPY . /src

# 5. expose port 8080 for nodejs
EXPOSE  8080

# 6. permission to execute anything in the src folder
RUN chmod +x -R /src

# 7. Command to run
CMD ["/src/bin/hubot", "--adapter", "slack"]