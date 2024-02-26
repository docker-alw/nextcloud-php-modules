# vim:set ft=dockerfile:
# hadolint ignore=DL3007
FROM alpine:latest

# hadolint ignore=DL3018
RUN set -x \
    && adduser -S -u 960 nextcloud \
    && install -d -o nextcloud /var/log/php82 \
    && ln -s /dev/stderr /var/log/php81/error.log
RUN apk --no-cache add \
        ffmpeg \
        imagemagick \
        libreoffice \
        php82-bcmath \
        php82-bz2 \
        php82-ctype \
        php82-curl \
        php82-dom \
        php82-exif \
        php82-fileinfo \
        php82-gd \
        php82-gettext \
        php82-gmp \
        php82-iconv \
        php82-imap \
        php82-intl \
        php82-mbstring \
        php82-opcache \
        php82-openssl \
        php82-pcntl \
        php82-pdo_mysql \
        php82-pecl-apcu \
        php82-pecl-imagick \
        php82-posix \
        php82-session \
        php82-simplexml \
        php82-sodium \
        php82-sysvsem \
        php82-xml \
        php82-xmlreader \
        php82-xmlwriter \
        php82-zip
