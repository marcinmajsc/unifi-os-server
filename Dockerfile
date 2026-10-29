FROM ghcr.io/marcinmajsc/uosserver:e09ce4c9de07-multiarch

LABEL org.opencontainers.image.source="https://github.com/marcinmajsc/unifi-os-server"

ENV container="docker"
ENV APP_VERSION="6.0.19"
ENV APP_MODEL="UOSSERVER"
ENV PRODUCT_NAME="UniFi OS Server"

STOPSIGNAL SIGRTMIN+3

RUN ["systemctl", "mask", "getty.target", "getty@.service", "serial-getty@.service", "console-getty.service", "container-getty@.service"]

COPY uos-entrypoint.sh /root/uos-entrypoint.sh

RUN ["chmod", "+x", "/root/uos-entrypoint.sh"]
ENTRYPOINT ["/root/uos-entrypoint.sh"]
