#!/bin/sh

# Get the container's IP address
IP=$(hostname -i)

# Start the bootnode and output the enode URL to a file
bootnode --nodekey /bootnode.key --addr "$IP:30301" --nat extip:$IP --writeaddress > /bootnode_data/enode.txt

# Output the enode information
echo "Bootnode enode information:"
cat /bootnode_data/enode.txt

# Keep the container running
tail -f /dev/null