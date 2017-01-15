FROM alpine
MAINTAINER Sebastian Hutter <mail@sebastian-hutter.ch>

RUN apk --no-cache add git && mkdir /root/.ssh

ADD config /root/.ssh/config