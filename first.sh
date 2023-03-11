#!/bin/bash

# Install IPFS
sudo apt-get update
sudo apt-get install -y ipfs

# Initialize IPFS
ipfs init

# Add second node as a bootstrap peer
ipfs bootstrap add /ip4/54.227.29.19/tcp/4001/ipfs/QmRjLzE7VKMjZpS9mdtRiNtGYcvmnSC4y4bwq3wvQ2jLcE

# Connect to second node
ipfs swarm connect /ip4/54.227.29.19/tcp/4001/ipfs/QmRjLzE7VKMjZpS9mdtRiNtGYcvmnSC4y4bwq3wvQ2jLcE

# Disable public gateway
ipfs config Addresses.Gateway /ip4/127.0.0.1/tcp/8080
