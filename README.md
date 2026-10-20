# nextcloud-php-modules

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/docker-alw/nextcloud-php-modules/main.svg)](https://results.pre-commit.ci/latest/github/docker-alw/nextcloud-php-modules/main)
[![dependabot update](https://github.com/docker-alw/nextcloud-php-modules/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/docker-alw/nextcloud-php-modules/actions/workflows/dependabot/dependabot-updates)
[![dependabot validate](https://github.com/docker-alw/nextcloud-php-modules/actions/workflows/dependabot_validate.yml/badge.svg)](https://github.com/docker-alw/nextcloud-php-modules/actions/workflows/dependabot_validate.yml)
[![Build Main Image](https://github.com/docker-alw/nextcloud-php-modules/actions/workflows/build_image.yml/badge.svg)](https://github.com/docker-alw/nextcloud-php-modules/actions/workflows/build_image.yml)

Docker image based on alpine with all modules required for Nextcloud installed.

It is intended to be used as base image for https://github.com/docker-alw/nextcloud and https://github.com/docker-alw/nextcloud-cron.

The following packages are installed:

* ffmpeg
* imagemagick
* libreoffice
* php85-bcmath
* php85-bz2
* php85-ctype
* php85-curl
* php85-dom
* php85-exif
* php85-fileinfo
* php85-gd
* php85-gettext
* php85-gmp
* php85-iconv
* php85-intl
* php85-mbstring
* php85-openssl
* php85-pcntl
* php85-pdo_mysql
* php85-pecl-apcu
* php85-pecl-imagick
* php85-posix
* php85-session
* php85-simplexml
* php85-sodium
* php85-sysvsem
* php85-xml
* php85-xmlreader
* php85-xmlwriter
* php85-zip

Removed with php85:

* php-imap: officially deprecated (https://www.php.net/manual/en/book.imap.php) and not needed (https://github.com/nextcloud/vm/blob/db8c7be9a90fb37ea240052869797ced46d0de1c/nextcloud_install_production.sh#L451)
* php-opcache: always bundled with PHP core (see https://lindevs.com/opcache-extension-is-always-available-in-php-8-5)

## Usage

To use the images build by this repository just run:

```bash
docker run --rm -ti ghcr.io/docker-alw/nextcloud-php-modules:latest # for main-branch version
# or
docker run --rm -ti ghcr.io/docker-alw/nextcloud-php-modules:test # for pull-request version
```

## Run aarch64 VM with Qemu

To test the aarch64 architecture of this container on x86_64 ArchLinux you can install 'qemu-full' and run:

```bash
mkdir aarch64_test
cd aarch64_test
cp /usr/share/edk2-armvirt/aarch64/QEMU_VARS.fd varstore.img
curl -O https://laotzu.ftp.acc.umu.se/images/cloud/bookworm/latest/debian-12-nocloud-arm64.qcow2
cp debian-12-nocloud-arm64.qcow2 image.img
qemu-system-aarch64 -m 4G -cpu max -M virt -boot menu=on -drive file=image.img,format=qcow2 -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/aarch64/QEMU_CODE.fd -drive if=pflash,format=raw,file=varstore.img
```

Within the VM you can install docker.io and run the container.
