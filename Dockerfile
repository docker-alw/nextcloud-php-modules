# vim:set ft=dockerfile:
# hadolint ignore=DL3007
FROM alpine:latest

# hadolint ignore=DL3018
RUN set -x \
    && adduser -S -u 960 nextcloud \
    && apk --no-cache add \
        ffmpeg \
        imagemagick \
        libreoffice \
        php81-bcmath \
        php81-bz2 \
        php81-ctype \
        php81-curl \
        php81-dom \
        php81-exif \
        php81-fileinfo \
        php81-gd \
        php81-gettext \
        php81-gmp \
        php81-iconv \
        php81-imap \
        php81-intl \
        php81-mbstring \
        php81-opcache \
        php81-openssl \
        php81-pcntl \
        php81-pdo_mysql \
        php81-pecl-apcu \
        php81-pecl-imagick \
        php81-posix \
        php81-session \
        php81-simplexml \
        php81-sysvsem \
        php81-xml \
        php81-xmlreader \
        php81-xmlwriter \
        php81-zip \
    && install -d -o nextcloud /var/log/php81 \
    && ln -s /dev/stderr /var/log/php81/error.log
