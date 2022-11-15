# Makefile with commands for quick testing and management of the containers
# If you came for deployment containers, this file won't be of use for you

help::
	@echo Usage: make [command]
	@echo Commands:
	@echo help - show this help message
	@echo clean - clear all untracked files
	@echo ccon - clear all containers
	@echo cimg - clear all images
	@echo cvol - clear all volumes

# Clear all untracked files
clean::
	git clean -fX

# Clear all containers
ccon::
	docker rm -f $(shell docker ps -a -q)

# Clear all images
cimg::
	docker rmi -f $(shell docker images -a -q)

# Clear all volumes
cvol::
	docker volume rm $(shell docker volume ls -q)
