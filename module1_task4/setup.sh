#!/bin/bash
apt-get update 
apt-get install -y hugo make
dpkg -s hugo make
make build