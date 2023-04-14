#!/bin/bash

export DISPLAY=:1
xhost +
docker run -it --gpus all --privileged --cap-add=SYS_PTRACE -v "/home/ravil/.Xauthority":"/home/user/.Xauthority:rw"\
  --env="DISPLAY" --net=host -v "/home/ravil/.ssh":"/home/user/.ssh" -v /media/work:/data --name=developer developer
