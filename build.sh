#!/usr/bin/qemu-arm-static /bin/sh

set -e

if [ ! -d /aports ]; then
  echo "/aports not mounted"
  exit 1
fi

if [ -z "$1" ]; then
  echo "USAGE:   $1 REPO/PACKAGE"
  echo "EXAMPLE: $1 base/busybox"
  exit 1
fi

echo "Building $1"

abuild-keygen -a -n
abuild-apk update
cd /aports/$1
abuild -R
