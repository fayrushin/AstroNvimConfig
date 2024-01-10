#!/bin/bash

xhost +
docker run -it --ulimit nofile=1024:4096 --gpus all --privileged --cap-add=SYS_PTRACE \
  -v /tmp/.X11-unix:/tmp/.X11-unix --env=DISPLAY  \
  --net=host -v "/home/ravil/.ssh":"/home/user/.ssh" \
  -v /home/ravil/Projects:/work --name=developer_new developer_new
