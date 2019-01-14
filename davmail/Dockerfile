FROM openjdk:8-jre-alpine

# mostly copied from jberrenberg/docker-davmail

RUN   adduser davmail -D \
  && apk add --no-cache ca-certificates wget openssl jq util-linux \
  && mkdir /usr/local/davmail \
  && wget -qO- https://downloads.sourceforge.net/project/davmail/davmail/5.1.0/davmail-5.1.0-2891.zip | busybox unzip -q /tmp/davmail.zip -d /usr/local/davmail - \
  && mkdir /var/log/davmail \
  && chown davmail:davmail /var/log/davmail -R \
  && mkdir -p /opt/certs \
  && wget https://raw.githubusercontent.com/containous/traefik/master/contrib/scripts/dumpcerts.sh -O /opt/dumpcerts.sh

COPY run.sh /

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

USER davmail

CMD bash /run.sh && /usr/local/davmail/davmail /etc/davmail/davmail.properties