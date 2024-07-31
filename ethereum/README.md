# Ethereum Private Network

This directory contains the components for setting up a private Ethereum network. The network consists of a bootnode, a JSON-RPC node, and a miner node.

## Components

1. Bootnode: Helps peers discover each other in the network
2. JSON-RPC Node: Provides an RPC interface to interact with the Ethereum network
3. Miner: Mines new blocks and processes transactions

## Running with Docker Compose
To run the entire Ethereum network locally:
From this directory, run: `docker-compose up -d`
This command will start all three components (bootnode, JSON-RPC node, and miner) in detached mode.

### Building Using Script

To build the Docker images for all components:
1. Run the build script:
`./build.sh <your-container-registry>`
Replace `<your-container-registry>` with your registry's URL (e.g., `us-central1-docker.pkg.dev/your-project-id/your-repo`)

Note: In production environment, this step should occur inside continuous integration.