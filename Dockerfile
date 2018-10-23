FROM alpine

MAINTAINER Gergő Sulymosi gergo.sulymosi@gmail.com

# TODO:
# the silversearcher
RUN apk update \
 && apk add --no-cache \
        automake autoconf ncurses-dev build-base python3 fish curl git \
        neovim tmux htop stow util-linux openssh ruby \
 && rm -f /tmp/* /etc/apk/cache/*

# RUN URL=https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` \
#     curl -L $URL > /usr/local/bin/docker-compose \
#  && chmod +x /usr/local/bin/docker-compose


# Install Tig
RUN git clone --depth 1 https://github.com/jonas/tig /tmp/tig \
 && cd /tmp/tig \
 && make configure \
 && ./configure \
 && make prefix=/usr/local \
 && make install prefix=/usr/local \
 && rm -rf /tmp/tig

# Dotfiles
RUN git clone --depth 1 --branch use-stow https://github.com/trekdemo/.dotfiles.git $HOME/.dotfiles \
  && cd $HOME/.dotfiles \
  && git remote rm origin \
  && git remote add origin git@github.com:trekdemo/.dotfiles \
  && ./install

# Install Fish
RUN sed -i -e "s/bin\/ash/usr\/bin\/fish/" /etc/passwd
ENV SHELL /usr/bin/fish
RUN curl -L https://get.oh-my.fish > install-omf \
 && fish install-omf --noninteractive --path=~/.local/share/omf --config=~/.config/omf \
 && rm install-omf

# RUN pip3 install neovim \
# RUN gem install neovim

VOLUME /root/projects

WORKDIR /root

ENV EDITOR=nvim
ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

CMD ["fish"]
