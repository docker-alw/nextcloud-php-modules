# nextcloud-php-modules

Docker image based on alpine with all modules required for Nextcloud installed.

It is intended to be used as base image for https://gitlab.com/docker-alw/nextcloud and https://gitlab.com/docker-alw/nextcloud-cron.

The following packages are installed:

* ffmpeg
* imagemagick
* libreoffice
* php82-bcmath
* php82-bz2
* php82-ctype
* php82-curl
* php82-dom
* php82-exif
* php82-fileinfo
* php82-gd
* php82-gettext
* php82-gmp
* php82-iconv
* php82-imap
* php82-intl
* php82-mbstring
* php82-opcache
* php82-openssl
* php82-pcntl
* php82-pdo_mysql
* php82-pecl-apcu
* php82-pecl-imagick
* php82-posix
* php82-session
* php82-simplexml
* php82-sodium
* php82-sysvsem
* php82-xml
* php82-xmlreader
* php82-xmlwriter
* php82-zip

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
