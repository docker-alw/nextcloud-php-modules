# nextcloud-php-modules

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/docker-alw/nextcloud-php-modules/main.svg)](https://results.pre-commit.ci/latest/github/docker-alw/nextcloud-php-modules/main)

Docker image based on alpine with all modules required for Nextcloud installed.

It is intended to be used as base image for https://github.com/docker-alw/nextcloud and https://github.com/docker-alw/nextcloud-cron.

The following packages are installed:

* ffmpeg
* imagemagick
* libreoffice
* php83-bcmath
* php83-bz2
* php83-ctype
* php83-curl
* php83-dom
* php83-exif
* php83-fileinfo
* php83-gd
* php83-gettext
* php83-gmp
* php83-iconv
* php83-imap
* php83-intl
* php83-mbstring
* php83-opcache
* php83-openssl
* php83-pcntl
* php83-pdo_mysql
* php83-pecl-apcu
* php83-pecl-imagick
* php83-posix
* php83-session
* php83-simplexml
* php83-sodium
* php83-sysvsem
* php83-xml
* php83-xmlreader
* php83-xmlwriter
* php83-zip

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
