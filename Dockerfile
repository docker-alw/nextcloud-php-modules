# vim:set ft=dockerfile:
FROM alpine:latest

RUN set -x \
	&& adduser -S -u 960 nextcloud \
	&& apk --no-cache add \
		ffmpeg \
		imagemagick \
		libreoffice \
		php7-apcu \
		php7-bcmath \
		php7-bz2 \
		php7-ctype \
		php7-curl \
		php7-dom \
		php7-exif \
		php7-fileinfo \
		php7-gd \
		php7-gettext \
		php7-gmp \
		php7-iconv \
		php7-imap \
		php7-intl \
		php7-json \
		php7-mbstring \
		php7-mcrypt \
		php7-opcache \
		php7-openssl \
		php7-pcntl \
		php7-pdo_mysql \
		php7-pecl-imagick \
		php7-posix \
		php7-session \
		php7-simplexml \
		php7-xml \
		php7-xmlreader \
		php7-xmlwriter \
		php7-zip \
		php7-zlib \
	&& install -d -o nextcloud /var/log/php7 \
	&& ln -s /dev/stderr /var/log/php7/error.log
