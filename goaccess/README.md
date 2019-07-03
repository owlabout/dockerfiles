Dockerimage for generating a [goaccess](https://goaccess.io) report from a traefik log file and sending it via mailgun.

If you are missing anything create a PR or an issue.

### Usage

```
https://github.com/owlabout/dockerfiles.git#:goaccess
```

see the `docker-compose.yml`

#### Options

The container expects the following parameters

```yml
# ...
environment: # optional
  - API_KEY # the mailgun api key
  - DOMAIN # the mailgun domain to send from
  - RECIPIENT # email where the report is sent
#...
```
