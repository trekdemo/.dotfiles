function rake --wraps "rake"
  bundle exec rake $argv
end
