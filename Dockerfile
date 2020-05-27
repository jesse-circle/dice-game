FROM alpine
MAINTAINER jesse@circleci.com

RUN apk update && apk add -u ca-certificates

COPY 1.13/dice-game /dice-game

COPY templates/index.html /templates/index.html

EXPOSE 9000

CMD ["/dice-game"]