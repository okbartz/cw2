FROM node:16

COPY server.js /usr/src/server

EXPOSE 8080

CMD {"Node","server.js"} 
