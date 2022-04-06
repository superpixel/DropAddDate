#!/bin/sh
# Assuming 'imagemagick' is installed. (brew install imagemagick)
BASEDIR=$(dirname "$0")
convert $BASEDIR/icon-*.tiff $BASEDIR/icon.tiff
echo "Merged TIFF 'icon.tiff' created"
tiff2icns $BASEDIR/icon.tiff $BASEDIR/droplet.icns
echo "Icon file 'droplet.icns' created from multipage TIFF"