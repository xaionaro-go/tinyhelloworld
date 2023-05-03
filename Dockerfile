FROM ubuntu:23.04

RUN apt-get update && \
	apt-get install -y git golang llvm-dev libclang-dev lld make nasm musl-dev && \
        (apt-get install -y llvm-15-dev libclang-15-dev lld-15 || true) && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/go/src/github.com/tinygo-org && git -C /root/go/src/github.com/tinygo-org clone --recursive https://github.com/tinygo-org/tinygo tinygo
RUN cd /root/go/src/github.com/tinygo-org/tinygo && go install ./

RUN mkdir /project
VOLUME /project
WORKDIR /project
ENV PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/root/go/bin
CMD ["make"]
