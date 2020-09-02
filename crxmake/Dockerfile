FROM alpine:3.9
RUN apk add --no-cache git openssl zip vim
RUN mkdir /app
RUN mkdir /app/crx_build
WORKDIR /app
COPY ./crxmake.sh /usr/local/bin/crxmake
COPY ./dist.pem ./dist.pem
