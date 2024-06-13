# vim:set ft=dockerfile:
# hadolint ignore=DL3007
FROM alpine:latest

COPY test.sh /test.sh
ARG PHP_VERSION=82
# hadolint ignore=DL3018
RUN set -x \
    && adduser -S -u 960 nextcloud \
    && install -d -o nextcloud "/var/log/php${PHP_VERSION}" \
    && ln -s /dev/stderr "/var/log/php${PHP_VERSION}/error.log"
# hadolint ignore=DL3018
RUN apk --no-cache add \
        ffmpeg \
        imagemagick \
        libreoffice \
        "php${PHP_VERSION}-bcmath" \
        "php${PHP_VERSION}-bz2" \
        "php${PHP_VERSION}-ctype" \
        "php${PHP_VERSION}-curl" \
        "php${PHP_VERSION}-dom" \
        "php${PHP_VERSION}-exif" \
        "php${PHP_VERSION}-fileinfo" \
        "php${PHP_VERSION}-gd" \
        "php${PHP_VERSION}-gettext" \
        "php${PHP_VERSION}-gmp" \
        "php${PHP_VERSION}-iconv" \
        "php${PHP_VERSION}-imap" \
        "php${PHP_VERSION}-intl" \
        "php${PHP_VERSION}-mbstring" \
        "php${PHP_VERSION}-opcache" \
        "php${PHP_VERSION}-openssl" \
        "php${PHP_VERSION}-pcntl" \
        "php${PHP_VERSION}-pdo_mysql" \
        "php${PHP_VERSION}-pecl-apcu" \
        "php${PHP_VERSION}-pecl-imagick" \
        "php${PHP_VERSION}-posix" \
        "php${PHP_VERSION}-session" \
        "php${PHP_VERSION}-simplexml" \
        "php${PHP_VERSION}-sodium" \
        "php${PHP_VERSION}-sysvsem" \
        "php${PHP_VERSION}-xml" \
        "php${PHP_VERSION}-xmlreader" \
        "php${PHP_VERSION}-xmlwriter" \
        "php${PHP_VERSION}-zip"
# hadolint ignore=DL3059
RUN apk --no-cache upgrade
