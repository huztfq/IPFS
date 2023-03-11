#!/bin/bash

# Install IPFS
sudo apt-get update
sudo apt-get install -y ipfs

# Initialize IPFS
ipfs init

# Add first node as a bootstrap peer
ipfs bootstrap add /ip4/34.234.67.238/tcp/4001/ipfs/QmPgrRLUykJjM6VHJ6hHHF6VJgZcCjbJX9YpPzU64JnCpb

# Connect to first node
ipfs swarm connect /ip4/34.234.67.238/tcp/4001/ipfs/QmPgrRLUykJjM6VHJ6hHHF6VJgZcCjbJX9YpPzU64JnCpb

# Disable public gateway
ipfs config Addresses.Gateway /ip4/127.0.0.1/tcp/8080
