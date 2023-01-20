#!/bin/bash

sudo apt install docker.io
sudo apt install docker-compose
# download the latest version of IPFS
wget https://dist.ipfs.io/go-ipfs/v0.7.0/go-ipfs_v0.7.0_linux-amd64.tar.gz

# extract the downloaded archive
tar xvfz go-ipfs_v0.7.0_linux-amd64.tar.gz

# move the extracted files to a directory in PATH
sudo mv go-ipfs/ipfs /usr/local/bin/

# create a new IPFS repo
ipfs init

# configure the IPFS daemon to run in "offline" mode
echo "--offline" > ~/.ipfs/config

# start the IPFS daemon
ipfs daemon &

# create a new IPFS node
ipfs bootstrap add /ip4/127.0.0.1/tcp/4001/ipfs/QmQ2r6iMNpky5f1m4cnm3Yqw8VSuUZ8DtQxnkZSJUcq6wR
