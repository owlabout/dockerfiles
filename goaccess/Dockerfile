FROM allinurl/goaccess
RUN apk add --update --no-cache curl ca-certificates
COPY /send.sh /

CMD [ "/bin/sh", "/send.sh"]
