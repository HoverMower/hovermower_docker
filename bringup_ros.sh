#!/bin/bash
xhost +
docker run -it --net=host \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$HOME/hovermower_overlay_ws:/overlay_ws:rw" \
    --privileged \
    --publish 4242:4242 \
    --ulimit nofile=1024 \
    ros:hovermower_overlay \
    bash