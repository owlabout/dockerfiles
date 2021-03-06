#!/bin/sh

if [[ -z "$CERT_DOMAIN" ]]; then
    exit 0;
fi
if [[ ! -f /traefik/acme.json ]]; then
    exit 0;
fi

/bin/sh /traefik/dumpcerts.sh /traefik/acme.json /traefik/ssl/
openssl pkcs12 -password env:CERT_PASS -export -in "/traefik/ssl/certs/$CERT_DOMAIN.crt" -inkey "/traefik/ssl/private/$CERT_DOMAIN.key" -out /etc/davmail/davmail.p12
chown davmail:davmail /etc/davmail/davmail.p12 && chmod 400 /etc/davmail/davmail.p12
