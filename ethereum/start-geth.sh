#!/bin/sh

# Wait for the enode.txt file to be created
while [ ! -f /bootnode_data/enode.txt ]; do
    echo "Waiting for bootnode enode information..."
    sleep 1
done

# Get the bootnode enode
BOOTNODE_ID=$(cat /bootnode_data/enode.txt)
BOOTNODE_IP=$(getent hosts bootnode | awk '{ print $1 }')
BOOTNODE_ENODE="enode://${BOOTNODE_ID}@${BOOTNODE_IP}:30301"

echo "Bootnode enode: $BOOTNODE_ENODE"

# Start geth with the correct bootnode
exec geth --datadir /root/.ethereum \
    --networkid 15 \
    --bootnodes $BOOTNODE_ENODE \
    --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.api eth,net,web3,personal,miner \
    --syncmode full \
    $@