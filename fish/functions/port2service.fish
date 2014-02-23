function port2service --description 'Checks port number to see what service is attached'
	lsof -i -P | grep $argv[1]
end

