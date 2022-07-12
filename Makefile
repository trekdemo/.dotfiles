IMAGE_NAME_VERSION="dev-shell:latest"

link:
	stow --target ~ dev executables git tmux xdg_config

unlink:
	stow --delete --target ~ dev executables git tmux xdg_config

brew_install:
	brew bundle install --global

build-docker-image:
	docker build -t $(IMAGE_NAME_VERSION) .
