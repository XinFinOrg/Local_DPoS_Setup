#!/bin/bash
#export $(cat .env | xargs)
source .env
Bin_NAME=XDC
WORK_DIR=$PWD
cd $PROJECT_DIR && make $Bin_NAME
cd $WORK_DIR

if [ ! -d ./nodes/4/$Bin_NAME/chaindata ]
then
  wallet4=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/4 <(echo ${PRIVATE_KEY_4}) | awk -v FS="({|})" '{print $2}')
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/4 init ./genesis/genesis.json
else
  wallet4=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/4 | head -n 1 | awk -v FS="({|})" '{print $2}')
fi

VERBOSITY=3
GASPRICE="1"

echo Starting the nodes ...
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "$BOOTNODE" --syncmode 'full' --datadir ./nodes/4 --networkid 89 --port 30306 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 8548 --rpcvhosts "*" --unlock "${wallet4}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "420000000" --verbosity ${VERBOSITY}
