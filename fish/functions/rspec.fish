function rspec
  if test -f ./docker-compose.yml
    echo "docker-compose run web rspec $argv"
    docker-compose run --rm web rspec $argv
  else if test -f ./bin/rspec
    echo "./bin/rspec $argv"
    ./bin/rspec $argv
  else
    echo "bundle exex rspec $argv"
    bundle exec rspec $argv
  end
end
