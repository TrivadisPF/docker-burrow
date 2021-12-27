FROM alpine:3.14

ENV BURROW_VERSION=1.3.8

LABEL maintainer="Guido Schmutz"

WORKDIR /burrow

RUN wget https://github.com/linkedin/Burrow/releases/download/v${BURROW_VERSION}/Burrow_${BURROW_VERSION}_linux_amd64.tar.gz -O /burrow/burrow_linux_amd64.tar.gz
RUN tar xvzf burrow_linux_amd64.tar.gz
RUN rm burrow_linux_amd64.tar.gz

RUN mkdir /etc/burrow
RUN cp /burrow/config/burrow.toml /etc/burrow/burrow.toml

CMD ["/burrow/burrow", "--config-dir", "/etc/burrow"]
