function pman --description 'Display man page in preview'
	man -t $argv[1] | open -f -a /Applications/Preview.app
end

