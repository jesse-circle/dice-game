FROM alpine
MAINTAINER jesse@circleci.com

RUN apk update && apk add -u ca-certificates

COPY 1.12/circleci /circleci

COPY templates/index.html /templates/index.html

EXPOSE 9000

CMD ["/circleci"]