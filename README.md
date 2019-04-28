# Debian + Inadyn 1.99 Docker Image for DNSOMatic

This repository contains a Dockerfile for building a
lighweight Docker image with the [inadyn](http://troglobit.com/inadyn.html)
dynamic DNS client.

# Running

Edit the inadyn.conf to match your configuration and run the
following (the scripts and cache directories are optional):

```
docker run \
   -d \
   -v $PWD/inadyn.conf:/etc/inadyn.conf \
   --name=inadyn \
   --restart=always \
   thedscman/debian-inadyn
```
