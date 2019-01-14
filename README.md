Provides Dockerfiles

Each directory has its own README containing specific instructions.

### Usage

Use the directories as build context in `docker build` or `docker-compose.yml`.

```bash
docker build https://github.com/owlabout/dockerfiles.git#:subdir
```

```dockerfile
version: "3.3"
# ...
services:
  mycontainer:
    build: https://github.com/owlabout/dockerfiles.git#:subdir
# ...
```
