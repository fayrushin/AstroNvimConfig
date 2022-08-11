#!/bin/bash

docker run --rm -it -v "${HOME}/.ssh":"${HOME}/.ssh" -v /data:/data   analytics_ide
