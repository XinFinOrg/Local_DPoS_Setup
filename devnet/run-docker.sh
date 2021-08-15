#!/bin/bash

# Default config
VERBOSITY=${LOG_LEVEL:-"3"}
NETWORK=${NETWORK_LEVEL:-"90"}
GASPRICE="1"

_interupt() { 
    echo "Shutdown $child_proc"
    kill -TERM $child_proc
    exit
}

trap _interupt INT TERM

mkdir keys


echo "Starting master node: ${NODE_NUM}"
  
# We keep the port different for different node number. This is futuer extensibility: i.e in case we want all containers run under the same host network
if [ $NODE_NUM == '1' ]
then
  # Node 1
  PORT=30303
  WS_PORT=8555
  RPC_PORT=8545
elif [ $NODE_NUM == '2' ]
then
  # Node 2
  PORT=30304
  WS_PORT=8556
  RPC_PORT=8546
elif [ $NODE_NUM == '3' ]
then
  # Node 3
  PORT=30305
  WS_PORT=8557
  RPC_PORT=8547
elif [ $NODE_NUM == '4' ]
then
  # Node 4
  PORT=30306
  WS_PORT=8558
  RPC_PORT=8548
else
  echo "No such node found: ${NODE_NUM}, exiting"
  exit 1
fi

touch .pwd_$NODE_NUM

# Start nodes
if [ ! -d ./nodes/$NODE_NUM/keystore ]
then
  key=PRIVATE_KEY_$NODE_NUM
  echo "${!key}" > keys/PRIVATE_KEY_$NODE_NUM.txt
  echo "Wallet created for node $NODE_NUM"
  /usr/local/bin/XDC account import --password .pwd_$NODE_NUM --datadir ./nodes/${NODE_NUM} ./keys/PRIVATE_KEY_${NODE_NUM}.txt | head -n 1| awk -v FS="--xdc" '{print $2}'
  /usr/local/bin/XDC --datadir ./nodes/${NODE_NUM} init ./genesis/genesis.json
else
  echo "Re-use Wallet for node $NODE_NUM"
fi

wallet=$(/usr/local/bin/XDC account list --datadir ./nodes/${NODE_NUM} | head -n 1 | awk -v FS="--xdc" '{print $2}')
echo "wallet address: $wallet"

echo "Starting the nodes ... $NODE_NUM"
/usr/local/bin/XDC \
  --bootnodes "$BOOTNODE" \
  --syncmode "full" \
  --datadir ./nodes/${NODE_NUM} \
  --networkid "${NETWORK}" \
  --port "${PORT}" \
  --rpc \
  --rpccorsdomain "*" \
  --ws \
  --wsaddr="0.0.0.0" \
  --wsorigins "*" \
  --wsport "${WS_PORT}" \
  --rpcaddr 0.0.0.0 \
  --rpcport "${RPC_PORT}" \
  --rpcvhosts "*" \
  --unlock "${wallet}" \
  --password .pwd_$NODE_NUM \
  --mine \
  --gasprice "${GASPRICE}" \
  --targetgaslimit "420000000" \
  --verbosity ${VERBOSITY} \
  --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS \
  --ethstats "${ETH_STATS_REGION}-${NODE_NUM}:xinfin_xdpos_hybrid_network_stats@devnetstats.apothem.network:2000"

wait # Do not exit the bash process