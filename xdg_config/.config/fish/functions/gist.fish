function gist
  set -l command (which gist)" --copy --open --shorten $argv"
  echo $command
  eval $command
end
