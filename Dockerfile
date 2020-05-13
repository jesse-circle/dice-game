FROM alpine
MAINTAINER jesse.lovelace@gmail.com

RUN apk update && apk add -u ca-certificates

COPY workspace/1.13/circleci /usr/bin/circleci

COPY templates/ /

EXPOSE 9000

CMD ["/usr/bin/circleci"]