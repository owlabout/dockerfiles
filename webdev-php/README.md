Dockerimage for running a php webdev environment based on [debian:9-slim](https://hub.docker.com/_/debian/).

Contains

- php7.2-fpm
- nginx
- xdebug
- node (for building deps)
-

If you are missing anything create a PR or an issue.

### Usage

```
https://github.com/owlabout/dockerfiles.git#:webdev-php
```

```bash
# build image
docker build  -t web https://github.com/owlabout/dockerfiles.git#:webdev-php
# start docker; starts bash by default
docker run web
```
