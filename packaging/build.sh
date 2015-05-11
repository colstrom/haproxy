#!/bin/sh

mkdir -p usr/sbin
mv haproxy haproxy-systemd-wrapper usr/sbin

TAG=`git describe --tags --abbrev=0`
COMMITS=`git rev-list --count $TAG..HEAD`
REVISION=`git describe --always`

fpm -s dir -t deb -n haproxy -v $TAG+$COMMITS@$REVISION -d libssl1.0.0 -d libpcrecpp0 -d zlib1g usr
