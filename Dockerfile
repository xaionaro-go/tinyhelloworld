FROM ubuntu:24.04

RUN apt-get update && \
	apt-get install -y wget gnupg make golang-go nasm

RUN cd /tmp && wget https://github.com/tinygo-org/tinygo/releases/download/v0.37.0/tinygo_0.37.0_amd64.deb && dpkg -i tinygo_*_amd64.deb

RUN mkdir /project
VOLUME /project
WORKDIR /project
ENV PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/root/go/bin
CMD ["make"]
