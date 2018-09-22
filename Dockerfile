FROM resin/armv7hf-alpine:3.8

ENV UID=1000

RUN [ "cross-build-start" ]

# Base setup taken from aports/.travis/setup-alpine
RUN apk add alpine-sdk lua-aports && \
    adduser -u $UID -G users -s /bin/sh -D build && \
    addgroup build abuild && \
    addgroup build wheel && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel && \
    sed -i 's/JOBS=[0-9]*/JOBS=$(nproc)/' /etc/abuild.conf && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles

RUN [ "cross-build-end" ]

ADD build.sh /build.sh

ENTRYPOINT ["/build.sh"]
