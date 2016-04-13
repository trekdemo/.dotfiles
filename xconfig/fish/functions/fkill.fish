function fkill
  ps -ef | sed 1d | fzf -m -q (commandline -b) | awk '{print $2}' | read -l pid

  if [ "x$pid" != "x" ]
    set -l command "kill -9 $pid"
    commandline -rb $command
  end
end
