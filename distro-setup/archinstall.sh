#!/usr/bin/env bash

## First update our system
pacman -Syu

# Install basic tools
sudo pacman -Ss \
	clapper \
	discord \
	docker \	
	firefox \
	git \
	keepassxc
	
# Remove with Pacman
pacman -Rs gnome-music \
	snapshot \
	simple-scan \
	evince \
	showtime \
	gnome-tour \
	sushi \
	gnome-user-docs
	yelp

./agnostic.sh
