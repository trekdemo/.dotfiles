function lzd
   docker run --rm \
              -it \
              -v /var/run/docker.sock:/var/run/docker.sock \
              -v $HOME/.lazydocker:/.config/jesseduffield/lazydocker \
              lazyteam/lazydocker
end
