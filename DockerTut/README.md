# Docker Node.js Tutorial

This project demonstrates running a Node.js Express app in Docker.

## Common Docker Commands

### Build the Docker Image

```
docker build -t docker_ex .
```

### Run the Docker Container

```
docker run -p 3002:3002 docker_ex
```

-   Maps port 3002 in the container to port 3002 on your host.

### See All Docker Images

```
docker images
```

### See All Containers (Running and Stopped)

```
docker ps -a
```

### Stop a Specific Container

```
docker stop <container_id>
```

-   Find `<container_id>` with `docker ps` or `docker ps -a`.

### Stop All Running Containers

```
docker ps -q | xargs -r docker stop
```

### Remove a Specific Container

```
docker rm <container_id>
```

### Remove All Stopped Containers

```
docker container prune
```

### Remove a Docker Image

```
docker rmi <image_id>
```

-   Find `<image_id>` with `docker images`.

## Quick Reference

-   Build: `docker build -t docker_ex .`
-   Run: `docker run -p 3002:3002 docker_ex`
-   List images: `docker images`
-   List containers: `docker ps -a`
-   Stop all: `docker ps -q | xargs -r docker stop`

---

For more, see the official Docker documentation: https://docs.docker.com/
