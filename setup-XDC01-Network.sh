#!/bin/bash

# Auther :- Anil Chinchawale
# AutherEmailID :- anil@xinfin.org
# Setup XDC Network blockchain with single script

echo "[*] Init XinFin XDC Network"

echo "[*] Please enter Project/Network name :- "
read project_name

# echo "[*]Specify your chain/network ID if you want an explicit one (default = random) :-"
# read network_id

PROJECT_ROOT_DIR=${project_name}_network
mypassword=''
DPOS_CUSTOM_GENESIS_FILE=${project_name}_genesis.json
Bin_NAME=XDC
rm -rf $PROJECT_ROOT_DIR
mkdir $PROJECT_ROOT_DIR
DPOS_GLOBAL_ARGS="--mine --rpc --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,dpos,posv,XDPoS  --rpcaddr 0.0.0.0"
ENODE_START_PORT=30301
RPC_START_PORT=8545
WS_START_PORT=9545

cd $PROJECT_ROOT_DIR
mkdir logs
killall $Bin_NAME
touch .pwd


WORK_DIR=$PWD
PROJECT_DIR="${HOME}/github/xinFinOrg/XDPoS-TestNet-Apothem"
cd $PROJECT_DIR && make all
cd $WORK_DIR


echo "[*] Please enter no. of inital nodes you wish to setup (min. 3) :- "
read numMN

if [[ $numMN > 9 ]]
then
    echo "Current Count ${numMN} , MasterNodes Count should not exceed more then 21..!"
    exit 1
fi

echo "[*] Creating Accounts for ${numMN} nodes"

for ((i= 1;i<= $numMN;i++)){
    echo $i
    ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir nodes/node_$i account new --password <(echo $mypassword)
    ACCOUNTS[$i]=`${PROJECT_DIR}/build/bin/$Bin_NAME account list --keystore nodes/node_$i/keystore | sed 's/^[^{]*{\([^{}]*\)}.*/\1/'`
    echo "[*] New account = ${ACCOUNTS[$i]}"
}

#Create Custom DPOS PUPPETH ARGS

DPoS_PUPPETH_ARGS="$project_name\n2\n3\n2\n\n\n${Accounts[$i]}\n"

for _ in `seq 1 2`;
do
 for ((i = 1; i <= $numMN; i++)) {
    DPoS_PUPPETH_ARGS+="${ACCOUNTS[$i]}\n"
  }
  DPoS_PUPPETH_ARGS+="\n"
done

#ADDED UNIQUE NETWORK ID
DPoS_PUPPETH_ARGS+="\n\n\n${ACCOUNTS[1]}\n\n\n"

DPoS_PUPPETH_ARGS+="${ACCOUNTS[$i]}\n"

for _ in `seq 1 2`;
do
 for ((i = 1; i <= $numMN; i++)) {
    DPoS_PUPPETH_ARGS+="${ACCOUNTS[$i]}\n"
  }
  DPoS_PUPPETH_ARGS+="\n"
done

#GENERATE RANDOM ID for the network
DPoS_PUPPETH_ARGS+="\n"

#ADD SOMETHING FUN INTO A BLOCK
# DPoS_PUPPETH_ARGS+="\n"

#GENERATE CUSTOM GENESIS FILE
DPoS_PUPPETH_ARGS+="2\n2\n$DPOS_CUSTOM_GENESIS_FILE\n"

echo "[*] PUPPETH_ARG = $DPoS_PUPPETH_ARGS"

printf $DPoS_PUPPETH_ARGS | ${PROJECT_DIR}/build/bin/puppeth &> logs/puppeth_output.log



# INIT GENESIS 
for (( i = 1;i<=$numMN;i++)){
    echo "[*] Init Node $i"
    ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir nodes/node_$i init $DPOS_CUSTOM_GENESIS_FILE $>> logs/node_$i.log
    echo "[*] Start Nodes $i"
    ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir nodes/node_$i $DPOS_GLOBAL_ARGS  --unlock ${ACCOUNTS[$i]} --password ./.pwd \
                                      --rpcport $(($RPC_START_PORT + $i - 2)) --port $(($ENODE_START_PORT + $i - 1)) --wsport $(($WS_START_PORT + $i - 1)) &>> logs/node_$i.log & 
 
    
}
echo "[*] Setting up network, please wait ..."
sleep 10

for ((i=1;i<=$numMN;i++)){
    if [ ! -e "nodes/node_$i/$Bin_NAME.ipc" ]; then
    sleep 2
    fi
}

#Create file of enodes
ENODES_FILE=enodes_list.txt
rm -rf $ENODES_FILE
for ((i = 1; i <= $numMN; i++)) {
  if [ -e "nodes/node_$i/$Bin_NAME.ipc" ]; then
    echo "[*] Directory found for node $i"
    ${PROJECT_DIR}/build/bin/$Bin_NAME --exec 'admin.nodeInfo.enode' attach nodes/node_$i/$Bin_NAME.ipc >> $ENODES_FILE 
  else "[*] Please check node $i, there is something wrong with it"
  fi
}

#ADD PEERS
for ((i = 1; i <= $numMN; i++)) {
 if [ -e "nodes/node_$i/$Bin_NAME.ipc" ]; then
  echo "[*] Add peers for node $i"
  OWNED_ENODE=`${PROJECT_DIR}/build/bin/$Bin_NAME --exec 'admin.nodeInfo.enode' attach nodes/node_$i/$Bin_NAME.ipc`
  #echo "Owned enode = $OWNED_ENODE"
  while read line; do
    if [ $OWNED_ENODE != $line ]; then
      ${PROJECT_DIR}/build/bin/$Bin_NAME --exec "admin.addPeer($line)" attach nodes/node_$i/$Bin_NAME.ipc >> "nodes_add_res.txt" 
    fi
  done < $ENODES_FILE
 fi
}
