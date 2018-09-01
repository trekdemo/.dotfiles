function host-ip --wraps "host"
  host $argv | awk '/has address/ { print $4 }'
end
