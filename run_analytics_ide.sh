#!/bin/bash

export DISPLAY=:1
xhost +
docker run -it --gpus all --privileged --cap-add=SYS_PTRACE -v "/home/ravil/.Xauthority":"/home/user/.Xauthority:rw"\
  --env="DISPLAY" --net=host -v "/home/ravil/.ssh":"/home/user/.ssh" -v /data:/data --name=analytics_ide analytics_ide
