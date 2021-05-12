FROM node:14
  
EXPOSE 8080

COPY ./ /home/node/app

WORKDIR /home/node/app

RUN ["npm", "install"]

WORKDIR /home/node/app/client

RUN ["npm", "install"]

RUN ["npm", "run-script", "build"]

WORKDIR /home/node/app

CMD ["node", "server.js"]
