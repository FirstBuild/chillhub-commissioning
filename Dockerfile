# DOCKER-VERSION 1.0.0
FROM resin/rpi-raspbian:wheezy
RUN apt-get update
RUN apt-get install -y wget dialog
RUN wget http://node-arm.herokuapp.com/node_latest_armhf.deb
RUN dpkg -i node_latest_armhf.deb
RUN apt-get install -y git python make g++ libudev-dev libusb-1.0-0-dev

RUN apt-get install -y ca-certificates
RUN wget https://raw.githubusercontent.com/bakerface/pifi/master/install
RUN chmod +x install && ./install

WORKDIR /src
ADD package.json /src/package.json
RUN npm install --production
ADD . /src
EXPOSE 80
CMD ["npm", "start"]

