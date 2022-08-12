#!/bin/bash

export DISPLAY=:0
docker run -it --gpus all --privileged --cap-add=SYS_PTRACE -v "$HOME/.Xauthority":"$HOME/.Xauthority:rw"\
  --env="DISPLAY" --net=host -v "${HOME}/.ssh":"${HOME}/.ssh" -v /data:/data   analytics_ide
