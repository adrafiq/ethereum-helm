
# Ethereum Network Helm Chart
This chart sets up an Ethereum network infrastructure, including:
- Bootnode for peer discovery
- JSON-RPC nodes for API access
- Miner nodes for block production

## Installing and updating

To install the chart:
`helm install ethereum-network . -f values.yaml -n NAMESPACE`
To upgrade an existing installation:
`helm upgrade my-ethereum-network . -f values.yaml`

## Working Principle
1.  **Nodes as StatefulSets**: Each node type (bootnode, JSON-RPC, miner) is deployed as a Kubernetes StatefulSet.
2.  **Shared enode Information**: The bootnode's enode information is shared with other nodes via a common persistent volume, allowing for dynamic peer discovery.
3.  **Genesis Configuration**: The genesis block configuration is provided through the `values.yaml` file.
4.  **Health Checks**: Each node type includes readiness and liveness probes to ensure the health and availability of the network components.

## Configuration
The following table lists the configurable parameters of the Ethereum network chart and their default values.
| Parameter | Description | Default |
|-----------|-------------|---------|
| `bootnode.replicaCount` | Number of bootnode replicas | `1` |
| `bootnode.image.repository` | Bootnode image repository | None |
| `bootnode.image.tag` | Bootnode image tag | `latest` |
| `bootnode.storage.size` | Size of bootnode storage | `5Gi` |
| `bootnode.storage.storageClass` | Storage class for bootnode | `standard-rwo` |
| `jsonrpc.replicaCount` | Number of JSON-RPC node replicas | `1` |
| `jsonrpc.image.repository` | JSON-RPC node image repository | None |
| `jsonrpc.image.tag` | JSON-RPC node image tag | `latest` |
| `jsonrpc.storage.size` | Size of JSON-RPC node storage | `20Gi` |
| `jsonrpc.storage.storageClass` | Storage class for JSON-RPC node | `standard-rwo` |
| `miner.replicaCount` | Number of miner node replicas | `1` |
| `miner.image.repository` | Miner node image repository | None |
| `miner.image.tag` | Miner node image tag | `latest` |
| `miner.storage.size` | Size of miner node storage | `50Gi` |
| `miner.storage.storageClass` | Storage class for miner node | `standard-rwo` |
| `storage.sharedStorageClass` | Storage class for shared enode information | `standard-rwo` |
| `networkId` | Ethereum network ID | `15` |
| `genesis` | Genesis block configuration | See `values.yaml` |