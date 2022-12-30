#!/bin/sh
. ./Pkgfile
curl -v -o $name-$version.zip \
https://github.com/IBM/plex/releases/download/v$version/TrueType.zip

