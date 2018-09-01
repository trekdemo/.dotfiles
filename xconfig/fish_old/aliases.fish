# Quick edits
function ef;          vim ~/.config/fish/config.fish; end
function efa;         vim ~/.config/fish/aliases.fish; end
function ev;          vim ~/.config/nvim/init.vim; end
function eg;          vim ~/.gitconfig; end
function et;          vim ~/.tmux.conf; end
function es;          vim ~/.ssh/config; end

# Shortcuts
function g;           git $argv; end
function b;           bundle $argv; end
function dc;          docker-compose $argv; end
function dm;          docker-machine $argv; end
function o;           open $argv; end
function oo;          open .; end
function :q;          exit; end
function v;           nvim $argv; end
function vim;         nvim $argv; end

# Directories
function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

# Utilities
function currentwifi; networksetup -getairportnetwork en0; end
function week; date +%V; end

# Bundle
function be; bundle exec     $argv; end
function bi; bundle install  $argv; end
function bl; bundle list     $argv; end
function bp; bundle package  $argv; end
function bu; bundle update   $argv; end
function bo; bundle open     $argv; end

# Networking
function hosts; sudo $EDITOR /etc/hosts; end
function ip; dig +short myip.opendns.com @resolver1.opendns.com; end
function ips; ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $argv[1]'; end
function localip; ipconfig getifaddr en0; end

# Directories
function md; mkdir -p $argv; end

function l1; tree --dirsfirst -ChFL 1 $argv; end
function l2; tree --dirsfirst -ChFL 2 $argv; end
function l3; tree --dirsfirst -ChFL 3 $argv; end
function l4; tree --dirsfirst -ChFL 4 $argv; end
function l5; tree --dirsfirst -ChFL 5 $argv; end
function l6; tree --dirsfirst -ChFL 6 $argv; end

function ll1; tree --dirsfirst -ChFupDaL 1 $argv; end
function ll2; tree --dirsfirst -ChFupDaL 2 $argv; end
function ll3; tree --dirsfirst -ChFupDaL 3 $argv; end
function ll4; tree --dirsfirst -ChFupDaL 4 $argv; end
function ll5; tree --dirsfirst -ChFupDaL 5 $argv; end
function ll6; tree --dirsfirst -ChFupDaL 6 $argv; end

function l;  l1 $argv; end
function ll; ll1 $argv; end

function gist
  set -l command (which gist)" --copy --open --shorten $argv"
  echo $command
  eval $command
end