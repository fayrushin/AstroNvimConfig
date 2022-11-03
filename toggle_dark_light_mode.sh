#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "You must enter <mode>"
    exit 1
fi
mode=$1

n1=$(grep -n 'colorscheme =' /home/user/.config/nvim/lua/user/init.lua | cut -d ':' -f1)
n2=$(grep -n 'lightTheme' /home/user/.config/lazygit/config.yml | cut -d ':' -f1)
if [[ "$mode" = "light" ]]; then
  sed -i "${n1}s/.*/  colorscheme = \"dayfox\",/" /home/user/.config/nvim/lua/user/init.lua
  sed -i "${n2}s/.*/    lightTheme: true/" /home/user/.config/lazygit/config.yml
  cp /home/user/.config/tmux/tmux.light.conf /home/user/.tmux.conf
else
  sed -i "${n1}s/.*/  colorscheme = \"nightfox\",/" /home/user/.config/nvim/lua/user/init.lua
  sed -i "${n2}s/.*/    lightTheme: false/" /home/user/.config/lazygit/config.yml
  cp /home/user/.config/tmux/tmux.dark.conf /home/user/.tmux.conf
fi
tmux source-file ~/.tmux.conf

