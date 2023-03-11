#!/bin/bash

# Download and extract IPFS software
wget https://dist.ipfs.io/go-ipfs/v0.10.0/go-ipfs_v0.10.0_linux-amd64.tar.gz
tar -xvf go-ipfs_v0.10.0_linux-amd64.tar.gz

# Change directory to the IPFS folder
cd go-ipfs

# Install IPFS software
sudo ./install.sh
