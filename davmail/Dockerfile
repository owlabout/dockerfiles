FROM openjdk:8-jre-alpine

# mostly copied from jberrenberg/docker-davmail

RUN   adduser davmail -D \
  && apk add --no-cache su-exec ca-certificates wget openssl jq util-linux \
  && mkdir /usr/local/davmail && mkdir /var/log/davmail \
  && wget -qO- https://downloads.sourceforge.net/project/davmail/davmail/5.1.0/davmail-5.1.0-2891.zip | busybox unzip -q /tmp/davmail.zip -d /usr/local/davmail - \
  && chmod +x /usr/local/davmail/davmail \
  && mkdir -p /traefik/ssl/certs && mkdir /traefik/ssl/private \
  && wget https://raw.githubusercontent.com/containous/traefik/v1.7/contrib/scripts/dumpcerts.sh -O /traefik/dumpcerts.sh \
  && chown -R davmail:davmail /usr/local/davmail /var/log/davmail

COPY run.sh /

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
WORKDIR       /usr/local/davmail

CMD /run.sh && su-exec davmail:davmail /usr/local/davmail/davmail /etc/davmail/davmail.properties