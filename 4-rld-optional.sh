#!/bin/bash

# Optional packages an config

sudo apt-get install gpointing-device-settings
sudo add-apt-repository ppa:voria/ppa
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install samsung-tools

# Front end dev

## Omega 4 dependencies
sudo apt-get install rubygems
sudo gem install bundler

## Latest version of nodejs from PPA
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
sudo npm install -g bower
