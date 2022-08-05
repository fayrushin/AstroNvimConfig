# Install AstroNvim with my config

This config supports:

1. C/CPP
2. CMake
3. Python
4. LLDB
5. debugpy

## Requirements

1. cmake
2. lldb
3. cargo
4. jq
5. golang

`sudo apt install cargo jq cmake lldb python3 python3-pip`

6. lazygit

`go install github.com/jesseduffield/lazygit@latest`

7. debugpy

`pip install debugpy`

8. nvm + node

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
nvm install node
```

9. nvim

download form [github](https://github.com/neovim/neovim/releases)

## Installation

Clone AstroNvim to nvim config dir:

`git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim`

Clone my own config to lua user dir

`git clone git@github.com:fayrushin/AstroNvimConfig.git ~/.config/nvim/lua/user`

Initialize nvim

`nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'`
