FROM i386/ubuntu:19.10

RUN apt-get update && \
	apt-get install -y git golang llvm-9-dev libclang-9-dev make nasm && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN go get github.com/tinygo-org/tinygo

RUN mkdir /project
VOLUME /project
WORKDIR /project
ENV PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/root/go/bin
CMD ["make"]
