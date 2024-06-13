#!/bin/sh

set -x -e -o pipefail

PHP_VERSION=83

getent passwd | grep nextcloud | grep 960

test -h /var/log/php${PHP_VERSION}/error.log

apk list -I | grep "php${PHP_VERSION}"
