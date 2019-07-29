FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y wget
RUN wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz && \
	tar -xvf go1.12.6.linux-amd64.tar.gz && \
	rm -f go1.12.6.linux-amd64.tar.gz
RUN mv go /usr/local
RUN apt-get install git -y && \
	git clone https://github.com/sourav82/goprojects.git
ENV GOROOT /usr/local/go
ENV GOPATH /goprojects
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
WORKDIR /goprojects
EXPOSE 8080
CMD ["go", "run", "httptests"]
