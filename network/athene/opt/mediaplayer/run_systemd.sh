#! /bin/sh
# Absolute path to this script, e.g. /home/pi/mediaplayer/run.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/pi/mediaplayer
SCRIPTPATH=$(dirname "$SCRIPT")

cd "${SCRIPTPATH}"
echo ${SCRIPTPATH}

export DISPLAY=:0
xset s off
xset -dpms

java -jar "${SCRIPTPATH}"/mediaplayer.jar > /dev/null &

