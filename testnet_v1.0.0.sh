
#!/bin/bash -x
_interupt() { 
    echo "Shutdown $child_proc"
    kill -TERM $child_proc
    exit
}

trap _interupt INT TERM

touch .pwd
#export $(cat .env | xargs)
source ./.env
Bin_NAME=XDC

WORK_DIR=$PWD
#PROJECT_DIR="/root/XinFin/XDPoS-TestNet-Apothem"
cd $PROJECT_DIR && make XDC
cd $WORK_DIR

if [ ! -d ./nodes/1/$Bin_NAME/chaindata ]
then
  echo $PRIVATE_KEY_1 > PRIVATE_KEY_1.txt
  echo $PRIVATE_KEY_2 > PRIVATE_KEY_2.txt
  echo $PRIVATE_KEY_3 > PRIVATE_KEY_3.txt
  wallet1=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/1 ./PRIVATE_KEY_1.txt | awk -v FS="({|})" '{print $2}')
  wallet2=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/2 ./PRIVATE_KEY_2.txt | awk -v FS="({|})" '{print $2}')
  wallet3=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/3 ./PRIVATE_KEY_3.txt | awk -v FS="({|})" '{print $2}')
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/1 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/2 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/3 init ./genesis/genesis.json
else
  wallet1=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/1 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet2=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/2 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet3=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/3 | head -n 1 | awk -v FS="({|})" '{print $2}')
fi

echo $wallet1
VERBOSITY=3
GASPRICE="1"


#echo Starting the bootnode ...
#${PROJECT_DIR}/build/bin/bootnode -nodekey ./bootnode.key --addr 0.0.0.0:30301 &
#child_proc=$! 

echo Starting the nodes ...
numMN=3
for ((i= 1;i<= $numMN;i++)){
  echo $i
  ${PROJECT_DIR}/build/bin/$Bin_NAME \
    --bootnodes $BOOTNODE \
    --syncmode "full" \
    --datadir ./nodes/$i \
    --networkid "${networkid}" \
    --port $((30302+$i)) \
    --rpc \
    --rpccorsdomain "*" \
    --ws --wsaddr="0.0.0.0" \--wsorigins "*" --wsport $((8554+$i)) \
    --rpcaddr 0.0.0.0 --rpcport $((8544+$i)) --rpcvhosts "*" \
    --unlock $((wallet$i)) \
    --password ./.pwd \
    --mine \
    --gasprice "${GASPRICE}" \
    --targetgaslimit "420000000" \
    --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS \
    --verbosity ${VERBOSITY} >> logs/node_$i.log 2>&1 &
    sleep 5
    #--ethstats "XinFin-Public-RPC:xinfin_test_network_stats@stats_testnet.xinfin.network:3000" 
}