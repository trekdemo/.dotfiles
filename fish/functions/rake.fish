function rake
  if test -f ./docker-compose.yml
    echo "docker-compose run web bundle exec rake $argv"
    docker-compose run web bundle exec rake $argv
  else if test -f ./bin/rake
    echo "./bin/rake $argv"
    ./bin/rake $argv
  else
    echo "bundle exec rake $argv"
    bundle exec rake $argv
  end
end
