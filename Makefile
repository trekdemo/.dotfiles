link:
	stow --adopt --target ~ home

unlink:
	stow --delete --target ~ home

brew_install:
	brew bundle install --global
