#!/bin/ash
# shellcheck shell=dash

set -x -e -o pipefail

# shellcheck disable=SC1091
. /php_version

getent passwd | grep nextcloud | grep 960

test -h "/var/log/php${PHP_VERSION}/error.log"

apk list -I | grep "php${PHP_VERSION}"
