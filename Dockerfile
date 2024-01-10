ARG BASE_IMAGE=ubuntu
ARG IMAGE_VERSION=22.04
FROM ${BASE_IMAGE}:${IMAGE_VERSION}

ARG USER_ID
ARG GROUP_ID

ENV TERM xterm-256color
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Russia/Moscow

# install developer dependencies
RUN \
  apt-get update \
  && apt-get -qy upgrade \
  && apt-get -qy install software-properties-common \
  && add-apt-repository ppa:git-core/ppa \
  && apt-get update \
  && apt-get remove -qy git \
  && apt-get install -qy locales python3 python3-pip \
  curl wget git ripgrep unzip python3-venv tar gzip tmux \
  sudo htop zsh tzdata apt-utils xclip ssh git-lfs ninja-build gettext \
  && rm -rf /var/lib/apt/lists/*	

WORKDIR /opt

RUN \
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
  && tar xf lazygit.tar.gz lazygit \
  && install lazygit /usr/local/bin \
  && rm -rf lazygit.tar.gz

RUN \
  git clone https://github.com/neovim/neovim --branch v0.9.5 --depth 1 \
  && cd neovim \
  && make CMAKE_BUILD_TYPE=Release \
  && make install \
  && cd /opt && rm -rf neovim

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# set up user and environment
RUN addgroup --gid $GROUP_ID user && \
  adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user && \
  echo "user:user" | chpasswd && adduser user sudo


USER user

ENV HOME /home/user

WORKDIR "$HOME"

ENV PATH="$HOME/.local/bin:$PATH"

# install Oh-My-ZSH
RUN wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | zsh || true

# install nvm + npm
ENV PROFILE "$HOME/.zshrc"
ENV NVM_DIR "$HOME/.nvm"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN /usr/bin/zsh -c "source $NVM_DIR/nvm.sh && nvm install node"

RUN \
  git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim && \
  git clone https://github.com/fayrushin/AstroNvimConfig ~/.config/nvim/lua/user

# copy dotfiles
# COPY --chown=user:user dotfiles/ /home/user/

ARG GIT_USER_NAME
ARG GIT_USER_EMAIL
# set git config options for user
RUN if [ ! -z "$GIT_USER_NAME" ] && [ ! -z "$GIT_USER_EMAIL" ]; then \
  git config --global user.name "$GIT_USER_NAME"; \
  git config --global user.email "$GIT_USER_EMAIL"; \
  fi

ENV SHELL /usr/bin/zsh

ENTRYPOINT [ "/usr/bin/zsh" ]
