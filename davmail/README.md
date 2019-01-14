Dockerimage for running a [davmail](http://davmail.sourceforge.net/) server in docker

If you are missing anything create a PR or an issue.

### Usage

```
https://github.com/owlabout/dockerfiles.git#:davmail
```

```bash
# build image
docker build  -t web https://github.com/owlabout/dockerfiles.git#:davmail
# start docker; starts bash by default
docker run web
```

#### Options

The container expects the following parameters

```yml
# ...
environment: # optional
  - CERT_DOMAIN=davmail.example.com
  - CERT_PASS=passwordSetInPropertiesFile
volumes:
  - ./davmail.properties:/etc/davmail/davmail.properties
  # optional together with env CERT_DOMAIN
  - /path/to/traefik/acme.json:/traefik/acme.json
#...
```

If the `$CERT_DOMAIN` environment variable is present and acme.json is linked in the container, [traefiks dumpcerts.sh](https://raw.githubusercontent.com/containous/traefik/master/contrib/scripts/dumpcerts.sh) will be used to create `/etc/davmail/davmail.p12` cert file.
