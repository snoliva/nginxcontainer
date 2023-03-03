# Basic configuration Nginx Docker

This is an example that how to build a simple nginx docker container. 
For it deployment, use the next commands:

### Build image with Dockerfile
```
docker build --rm -t <nameimage:version> .
```

### Deploy docker nginx
```
docker run --rm -p 80:80 --name <namecontainer> <nameimage:version>
```