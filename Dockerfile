FROM php:fpm-alpine

COPY docker-entrypoint.sh /
RUN apk add --no-cache \
        git \
        bash \
        nginx \
        tzdata \
        python2 \
        python3 \
        openssh && \
    chmod +x /docker-entrypoint.sh && \
    ssh-keygen -A

EXPOSE 80
# Persistent
ENTRYPOINT [ "/docker-entrypoint.sh" ]