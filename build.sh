#!/bin/bash

# Install IPFS software
wget https://dist.ipfs.io/go-ipfs/v0.9.1/go-ipfs_v0.9.1_linux-amd64.tar.gz
tar -xvf go-ipfs_v0.9.1_linux-amd64.tar.gz
cd go-ipfs
sudo ./install.sh

# Initialize IPFS node
ipfs init

# Configure IPFS node
echo '{"API": {"HTTPHeaders": {"Access-Control-Allow-Origin": ["*"]}}, "Swarm": {"AddrFilters": null, "DisableBandwidthMetrics": false, "DisableNatPortMap": false, "DisableRelay": false, "EnableAutoRelay": false, "EnableAutoNATService": false, "EnableRelayHop": false, "Transports": {"Multiplexers": {}, "Network": {}}, "ConnMgr": {"Type": "basic", "LowWater": 50, "HighWater": 100}}, "Addresses": {"Swarm": ["/ip4/0.0.0.0/tcp/4001", "/ip4/127.0.0.1/tcp/4001", "/ip6/::1/tcp/4001"], "API": "/ip4/127.0.0.1/tcp/5001", "Gateway": "/ip4/0.0.0.0/tcp/8080", "Delegates": []}}' > ~/.ipfs/config

# Start IPFS daemon
ipfs daemon --init &

# Wait for IPFS daemon to start
sleep 5

# Share content
echo "Hello World!" > hello.txt
ipfs add hello.txt

# Connect to other IPFS nodes
ipfs swarm connect /dnsaddr/bootstrap.libp2p.io/ipfs/QmNnooDu7bfBzgo5b7y1LhRfg58ncK1zZquwbALqKGGg3y
ipfs swarm connect /ip4/54.172.108.174/tcp/4001/ipfs/QmZ4xoY5EtPvS8S2Qz7FucA4d5pX4Bm1PPBCbLE6gfv1jf

# Print the address of this node
echo "IPFS node address: /ip4/54.172.108.174/tcp/4001/p2p/$(ipfs config Identity.PeerID)"
