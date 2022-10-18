ARG BASE_IMAGE=ubuntu
ARG IMAGE_VERSION=20.04
FROM ${BASE_IMAGE}:${IMAGE_VERSION}

ARG USER_ID
ARG GROUP_ID

ENV TERM xterm-256color
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Russia/Moscow

RUN \
    apt-get update && \
    apt-get -qq -y upgrade

RUN \
    apt-get install -q -y locales cargo jq lldb python3 python3-pip \
    curl wget git ripgrep unzip python3.8-venv tar gzip clangd tmux \
    sudo htop zsh tzdata apt-utils xclip ssh git-lfs

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN wget -q https://go.dev/dl/go1.19.linux-amd64.tar.gz && \
    tar -C /usr/local/ -xzf go1.19.linux-amd64.tar.gz
RUN \
    wget -q https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb && \
    apt-get install -q -y ./nvim-linux64.deb

# set up user and environment
RUN addgroup --gid $GROUP_ID user && \
  adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user && \
  echo "user:user" | chpasswd && adduser user sudo

RUN chsh -s /usr/bin/zsh user

USER user

ENV HOME /home/user

WORKDIR "$HOME"

ENV PATH="$HOME/.cargo/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:/usr/local/bin:$PATH"

RUN pip install debugpy

# install Oh-My-ZSH
RUN wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | zsh || true

# install nvm + npm
ENV PROFILE "$HOME/.zshrc"
ENV NVM_DIR "$HOME/.nvm"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN /usr/bin/zsh -c "source $NVM_DIR/nvm.sh && nvm install node"

RUN go install github.com/jesseduffield/lazygit@latest


RUN \
    git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim && \
    git clone https://github.com/fayrushin/AstroNvimConfig ~/.config/nvim/lua/user
# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    

# copy dotfiles
COPY --chown=user:user dotfiles/.config .config

ARG GIT_USER_NAME
ARG GIT_USER_EMAIL
# set git config options for user
RUN if [ ! -z "$GIT_USER_NAME" ] && [ ! -z "$GIT_USER_EMAIL" ]; then \
    git config --global user.name "$GIT_USER_NAME"; \
    git config --global user.email "$GIT_USER_EMAIL"; \
  fi

CMD tmux
