# Dockerfile for troglobit's inadyn
#
# See: http://troglobit.com/inadyn.html
#      https://github.com/troglobit/inadyn/releases
#

FROM debian:stretch-slim

ENV S6_VERSION 1.21.2.2
ENV S6_ARCH amd64

RUN apt-get -q update \
 && apt-get install -qy --no-install-recommends \
    curl tar git ca-certificates nano less coreutils procps inadyn bash \
 && apt-get -qqy autoremove \
 && apt-get -qqy clean \
 && rm -rf /var/lib/apt/lists/* 
     
RUN curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v$S6_VERSION/s6-overlay-$S6_ARCH.tar.gz | tar -xzC /

ENTRYPOINT ["/usr/sbin/inadyn"]
