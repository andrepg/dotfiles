#!/usr/bin/env bash

brew install docker-compose
mkdir ~/.docker
mkdir ~/.docker/cli-plugins
ln --symbolic /home/linuxbrew/.linuxbrew/bin/docker-compose ~/.docker/cli-plugins/docker-compose

