FROM ubuntu:20.04

ENV PATH="$HOME/.cargo/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:/usr/lib/cuda/bin:/usr/local/bin:$PATH"
ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && \
    apt-get install -q -y cargo jq cmake lldb python3 python3-pip \
    curl wget git ripgrep unzip python3.8-venv tar gzip clangd

RUN pip install debugpy

ENV NVM_DIR /usr/local/nvm
RUN mkdir -p /usr/local/nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install node"

RUN wget -q https://go.dev/dl/go1.19.linux-amd64.tar.gz && \
    tar -C /usr/local/ -xzf go1.19.linux-amd64.tar.gz
RUN go install github.com/jesseduffield/lazygit@latest

RUN \
    wget -q https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb && \
    apt-get install -q -y ./nvim-linux64.deb

RUN \
    git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim && \
    git clone https://github.com/fayrushin/AstroNvimConfig ~/.config/nvim/lua/user
# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
