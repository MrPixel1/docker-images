#!/bin/bash

set -e

mkdir -p $AIRSONIC_DIR/data/transcode
ln -fs /usr/bin/ffmpeg $AIRSONIC_DIR/data/transcode/ffmpeg
ln -fs /usr/bin/lame $AIRSONIC_DIR/data/transcode/lame

if [[ $# -lt 1 ]] || [[ ! "$1" == "java"* ]]; then
    exec java -Xmx256m \
     -Dserver.host=0.0.0.0 \
     -Dserver.port=$AIRSONIC_PORT \
     -Dserver.contextPath=$CONTEXT_PATH \
     -Dairsonic.home=$AIRSONIC_DIR/data \
     -Dairsonic.defaultMusicFolder=$AIRSONIC_DIR/music \
     -Dairsonic.defaultPodcastFolder=$AIRSONIC_DIR/podcasts \
     -Dairsonic.defaultPlaylistFolder=$AIRSONIC_DIR/playlists \
     -DUPNP_PORT=$UPNP_PORT \
     -Djava.awt.headless=true \
     -jar airsonic.war "$@"
fi

exec "$@"
