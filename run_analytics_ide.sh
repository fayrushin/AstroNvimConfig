#!/bin/bash

xhost +
docker run -it --gpus all --privileged --cap-add=SYS_PTRACE \
  -v /tmp/.X11-unix:/tmp/.X11-unix --env=DISPLAY  \
  --net=host -v "/home/ravil/.ssh":"/home/user/.ssh" \
  -v /home/ravil/Projects:/work --name=developer analytics_develop
