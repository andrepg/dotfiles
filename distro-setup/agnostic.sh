#!/usr/bin/env bash

# Install Brew & Flatpak system + custom apps
./brew.sh
./flatpak.sh

# Install Oh My Bash
eval $(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)
