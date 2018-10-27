IMAGE_NAME_VERSION="dev-shell:latest"

link:
	stow dev executables git tmux xdg_config

unlink:
	stow --delete dev executables git tmux xdg_config

build-docker-image:
	docker build -t $(IMAGE_NAME_VERSION) .
