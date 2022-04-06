#!/bin/sh
BASEDIR=$(dirname "$0")
osacompile -o "$BASEDIR/DropAddDate.app" "$BASEDIR/DropAddDate.applescript"
echo "Compiled 'DropAddDate.app'"
cp "$BASEDIR/Icon/droplet.icns" "$BASEDIR/DropAddDate.app/Contents/Resources/"
echo "Default icon replaced"
cp "$BASEDIR/Properties/Info.plist" "$BASEDIR/DropAddDate.app/Contents/"
echo "Default 'Info.plist' replaced"
