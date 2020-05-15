FROM alpine
MAINTAINER jesse@circleci.com

RUN apk update && apk add -u ca-certificates

COPY 1.13/circleci /circleci

COPY templates/ /

EXPOSE 9000

CMD ["/circleci"]