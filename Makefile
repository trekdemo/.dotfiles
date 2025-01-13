IMAGE_NAME_VERSION="dev-shell:latest"

link:
	stow --adopt --target ~ home 

unlink:
	stow --delete --target ~ home

brew_install:
	brew bundle install --global

build-docker-image:
	docker build -t $(IMAGE_NAME_VERSION) .
