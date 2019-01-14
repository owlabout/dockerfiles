#!/bin/sh

if [[ -z "$CERT_DOMAIN" ]]; then
    exit 0;
fi
if [[ ! -f /traefik/acme.json ]]; then
    exit 0;
fi

bash dumpcerts.sh /traefik/acme.json /opt/ssl/
openssl pkcs12 -export -in "/opt/ssl/certs/$CERT_DOMAIN.crt" -inkey "/opt/ssl/private/$CERT_DOMAIN.key" -out /etc/davmail/davmail.p12
