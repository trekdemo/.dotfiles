function bundle
  if test -f ./docker-compose.yml
    echo "docker-compose run web bundle $argv"
    docker-compose run web bundle $argv
  else
    set -l bundle_bin (which bundle)
    set -l cmd "$bundle_bin $argv"
    echo $cmd
    eval $cmd
  end
end
