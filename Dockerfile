FROM alpine:3.8
MAINTAINER Robert Bo Davis <bo@interrobang.consulting>

RUN apk add --update bash git

COPY main.sh /usr/bin/main.sh

ENTRYPOINT [ "main.sh" ]
