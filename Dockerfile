FROM node:7.7-alpine
RUN ls -latr
RUN pwd
# install deps
ADD package.json /tmp/package.json
RUN ls -latr
RUN pwd
RUN cd /tmp && npm install
RUN ls -latr
RUN pwd
# Copy deps
RUN mkdir -p /opt/to-do-app && cp -a /tmp/node_modules /opt/to-do-app

# Setup workdir
WORKDIR /opt/to-do-app
RUN ls -latr
RUN mkdir /opt/to-do-app/dist
RUN ls -latr
COPY /tmp/dist /opt/to-do-app/dist
COPY /tmp/server.js /opt/to-do-app
COPY /tmp/initialize.js /opt/to-do-app

# run
EXPOSE 8080
CMD ["sh", "-c", "node initialize && node server"]
