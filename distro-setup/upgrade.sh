#!/bin/bash

echo "Upgrading system Flatpaks" &&
flatpak upgrade --assumeyes --noninteractive &&
echo "Upgrading user Flatpaks" &&
flatpak upgrade --user --assumeyes --noninteractive &&
echo "Upgrading Brew and formulaes"
brew update && brew upgrade &&
echo "Upgrading system" &&
rpm-ostree upgrade --reboot
