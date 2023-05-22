#!/bin/bash
apt-get update 
apt-get install -y hugo make
curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb
apt-get install ./hugo.deb
dpkg -s hugo make
sudo go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.52.2
sudo npm install -g markdownlint-cli
sudo npm install -g markdown-link-check
make build