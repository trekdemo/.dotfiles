FROM alpine

MAINTAINER Gergő Sulymosi gergo.sulymosi@gmail.com
VOLUME /root/projects

# TODO: the silversearcher
RUN apk update \
 && apk add --no-cache \
        automake autoconf ncurses-dev build-base fish curl util-linux htop openssh \
        stow neovim tmux git tig \
        ruby-dev ruby go nodejs npm python3-dev python3 python-dev python docker \
 && rm -f /tmp/* /etc/apk/cache/* \
 && python -m ensurepip --default-pip \
 && pip3 install --upgrade pip \
 && pip install --upgrade pip

# Dotfiles
ADD . /root/.dotfiles
# RUN git clone --depth 1 --branch use-stow https://github.com/trekdemo/.dotfiles.git $HOME/.dotfiles \
RUN cd $HOME/.dotfiles \
 && git remote rm origin \
 && git remote add origin git@github.com:trekdemo/.dotfiles \
 && make link

# Install Fish
RUN sed -i -e "s/bin\/ash/usr\/bin\/fish/" /etc/passwd
ENV SHELL /usr/bin/fish
RUN curl -L https://get.oh-my.fish > install-omf \
 && fish install-omf --noninteractive --path=~/.local/share/omf --config=~/.config/omf \
 && rm install-omf

# Install NeoVim
RUN npm install -g typescript neovim \
 && pip3 install neovim \
 && pip install neovim \
 && gem install neovim \
 && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
 && nvim -c PlugInstall -c UpdateRemotePlugins -c qall

ENV EDITOR=nvim
ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

WORKDIR /root
CMD ["fish"]
