# Install AstroNvim with my config

This config supports:
1. C/CPP
2. CMake
3. Python
4. LLDB
5. debugpy

Clone AstroNvim to nvim config dir:

`git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim`

Clone my own config to lua user dir

`git clone git@github.com:fayrushin/AstroNvimConfig.git ~/.config/nvim/lua/user`

Initialize nvim

`nvim  --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'`


