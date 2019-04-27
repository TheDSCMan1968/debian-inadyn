# Dockerfile for troglobit's inadyn
#
# See: http://troglobit.com/inadyn.html
#      https://github.com/troglobit/inadyn/releases
#      https://github.com/troglobit/libite/releases
#      https://github.com/martinh/libconfuse/releases
#
# Run inadyn with strace if it exits without any error
#

FROM alpine:edge

ENV INADYN_RELEASE https://github.com/troglobit/inadyn/releases/download/1.99.15/inadyn-1.99.15.tar.xz
ENV LIBITE_RELEASE https://github.com/troglobit/libite/releases/download/v2.0.1/libite-2.0.1.tar.xz
ENV LIBCONFUSE_RELEASE https://github.com/martinh/libconfuse/releases/download/v3.2.1/confuse-3.2.1.tar.xz

RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk --update add curl xz build-base libressl-dev ca-certificates bash inadyn && \
    # Cleanup
    rm -rf /tmp/src && \
    apk del xz build-base && \
    rm -rf /var/cache/apk/* && \
    # Create Directories
    mkdir -p /usr/local/var/run && \
    mkdir -p /usr/local/var/cache && \
    mkdir -p /usr/var/run && \
    mkdir -p /usr/var/cache 
     
VOLUME /usr/local/etc /usr/local/var/run /usr/local/var/cache
# Dockerfile for troglobit's inadyn
#
# See: http://troglobit.com/inadyn.html
#      https://github.com/troglobit/inadyn/releases
#      https://github.com/troglobit/libite/releases
#      https://github.com/martinh/libconfuse/releases
#
# Run inadyn with strace if it exits without any error
#

FROM alpine:edge

ENV INADYN_RELEASE https://github.com/troglobit/inadyn/releases/download/1.99.15/inadyn-1.99.15.tar.xz
ENV LIBITE_RELEASE https://github.com/troglobit/libite/releases/download/v2.0.1/libite-2.0.1.tar.xz
ENV LIBCONFUSE_RELEASE https://github.com/martinh/libconfuse/releases/download/v3.2.1/confuse-3.2.1.tar.xz

RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk --update add curl xz build-base libressl-dev ca-certificates bash inadyn && \
    # Cleanup
    rm -rf /tmp/src && \
    apk del xz build-base && \
    rm -rf /var/cache/apk/* && \
    # Create Directories
    mkdir -p /usr/local/var/run && \
    mkdir -p /usr/local/var/cache && \
    mkdir -p /usr/var/run && \
    mkdir -p /usr/var/cache 
     
VOLUME /usr/local/etc /usr/local/var/run /usr/local/var/cache

ENTRYPOINT ["/usr/sbin/inadyn", "--loglevel=debug --foreground -P /usr/var/run/inadyn.pid --cache-dir=/usr/var/cache -C"]
