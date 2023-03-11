#!/bin/bash

# Install IPFS software
wget https://dist.ipfs.io/go-ipfs/v0.9.1/go-ipfs_v0.9.1_linux-amd64.tar.gz
tar -xvf go-ipfs_v0.9.1_linux-amd64.tar.gz
cd go-ipfs
sudo ./install.sh

# Initialize IPFS node
ipfs init --profile server

# Check if fs-repo needs to be migrated
if [ -e ~/.ipfs/api ]; then
    ipfs daemon --migrate &
else
    ipfs daemon &
fi

# Wait for IPFS daemon to start
sleep 5

# Share content
echo "Hello World!" > hello.txt
ipfs add hello.txt

# Set public gateway address
ipfs config --json Addresses.Gateway '"/ip4/0.0.0.0/tcp/8080"'
ipfs config --json Addresses.API '"/ip4/0.0.0.0/tcp/5001"'

# Connect to other IPFS nodes
ipfs swarm connect /dnsaddr/bootstrap.libp2p.io/ipfs/QmNnooDu7bfBzgo5b7y1LhRfg58ncK1zZquwbALqKGGg3y
