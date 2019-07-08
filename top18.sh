#!/bin/bash
_interupt() { 
    echo "Shutdown $child_proc"
    kill -TERM $child_proc
    exit
}

trap _interupt INT TERM

touch .pwd
export $(cat .env | xargs)
Bin_NAME=XDC

WORK_DIR=$PWD
PROJECT_DIR="/home/ronak/XDPoS-TestNet-Apothem"
cd $PROJECT_DIR && make all
cd $WORK_DIR

if [ ! -d ./nodes/1/$Bin_NAME/chaindata ]
then
  wallet1=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/1 <(echo ${PRIVATE_KEY_1}) | awk -v FS="({|})" '{print $2}')
  wallet2=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/2 <(echo ${PRIVATE_KEY_2}) | awk -v FS="({|})" '{print $2}')
  wallet3=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/3 <(echo ${PRIVATE_KEY_3}) | awk -v FS="({|})" '{print $2}')
  wallet4=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/4 <(echo ${PRIVATE_KEY_4}) | awk -v FS="({|})" '{print $2}')
  wallet5=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/5 <(echo ${PRIVATE_KEY_5}) | awk -v FS="({|})" '{print $2}')
  wallet6=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/6 <(echo ${PRIVATE_KEY_6}) | awk -v FS="({|})" '{print $2}')
  wallet7=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/7 <(echo ${PRIVATE_KEY_7}) | awk -v FS="({|})" '{print $2}')
  wallet8=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/8 <(echo ${PRIVATE_KEY_8}) | awk -v FS="({|})" '{print $2}')
  wallet9=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/9 <(echo ${PRIVATE_KEY_9}) | awk -v FS="({|})" '{print $2}')
  wallet10=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/10 <(echo ${PRIVATE_KEY_10}) | awk -v FS="({|})" '{print $2}')
  wallet11=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/11 <(echo ${PRIVATE_KEY_11}) | awk -v FS="({|})" '{print $2}')
  wallet12=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/12 <(echo ${PRIVATE_KEY_12}) | awk -v FS="({|})" '{print $2}')
  wallet13=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/13 <(echo ${PRIVATE_KEY_13}) | awk -v FS="({|})" '{print $2}')
  wallet14=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/14 <(echo ${PRIVATE_KEY_14}) | awk -v FS="({|})" '{print $2}')
  wallet15=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/15 <(echo ${PRIVATE_KEY_15}) | awk -v FS="({|})" '{print $2}')
  wallet16=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/16 <(echo ${PRIVATE_KEY_16}) | awk -v FS="({|})" '{print $2}')
  wallet17=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/17 <(echo ${PRIVATE_KEY_17}) | awk -v FS="({|})" '{print $2}')
  wallet18=$(${PROJECT_DIR}/build/bin/$Bin_NAME account import --password .pwd --datadir ./nodes/18 <(echo ${PRIVATE_KEY_18}) | awk -v FS="({|})" '{print $2}')
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/1 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/2 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/3 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/4 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/5 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/6 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/7 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/8 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/9 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/10 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/11 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/12 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/13 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/14 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/15 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/16 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/17 init ./genesis/genesis.json
  ${PROJECT_DIR}/build/bin/$Bin_NAME --datadir ./nodes/18 init ./genesis/genesis.json
else
  wallet1=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/1 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet2=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/2 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet3=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/3 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet4=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/4 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet5=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/5 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet6=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/6 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet7=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/7 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet8=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/8 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet9=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/9 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet10=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/10 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet11=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/11 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet12=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/12 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet13=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/13 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet14=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/14 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet15=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/15 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet16=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/16 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet17=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/17 | head -n 1 | awk -v FS="({|})" '{print $2}')
  wallet18=$(${PROJECT_DIR}/build/bin/$Bin_NAME account list --datadir ./nodes/18 | head -n 1 | awk -v FS="({|})" '{print $2}')
fi

VERBOSITY=3
GASPRICE="1"

echo Starting the bootnode ...
${PROJECT_DIR}/build/bin/bootnode -nodekey ./bootnode.key --addr 0.0.0.0:30301 &
child_proc=$! 

echo Starting the nodes ...
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/1 --networkid 51 --port 30303 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8555 --rpcaddr 0.0.0.0 --rpcport 8545 --rpcvhosts "*" --unlock "${wallet1}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/2 --networkid 51 --port 30304 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8556 --rpcaddr 0.0.0.0 --rpcport 8546 --rpcvhosts "*" --unlock "${wallet2}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/3 --networkid 51 --port 30305 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8557 --rpcaddr 0.0.0.0 --rpcport 8547 --rpcvhosts "*" --unlock "${wallet3}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/4 --networkid 51 --port 30306 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8558 --rpcaddr 0.0.0.0 --rpcport 8548 --rpcvhosts "*" --unlock "${wallet4}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/5 --networkid 51 --port 30307 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8559 --rpcaddr 0.0.0.0 --rpcport 8549 --rpcvhosts "*" --unlock "${wallet5}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/6 --networkid 51 --port 30308 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8560 --rpcaddr 0.0.0.0 --rpcport 8550 --rpcvhosts "*" --unlock "${wallet6}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/7 --networkid 51 --port 30309 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8561 --rpcaddr 0.0.0.0 --rpcport 8551 --rpcvhosts "*" --unlock "${wallet7}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/8 --networkid 51 --port 30310 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8562 --rpcaddr 0.0.0.0 --rpcport 8552 --rpcvhosts "*" --unlock "${wallet8}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/9 --networkid 51 --port 30311 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8563 --rpcaddr 0.0.0.0 --rpcport 8553 --rpcvhosts "*" --unlock "${wallet9}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/10 --networkid 51 --port 30312 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8564 --rpcaddr 0.0.0.0 --rpcport 8554 --rpcvhosts "*" --unlock "${wallet10}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/11 --networkid 51 --port 30313 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8565 --rpcaddr 0.0.0.0 --rpcport 8573 --rpcvhosts "*" --unlock "${wallet11}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/12 --networkid 51 --port 30314 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8566 --rpcaddr 0.0.0.0 --rpcport 8574 --rpcvhosts "*" --unlock "${wallet12}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/13 --networkid 51 --port 30315 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8567 --rpcaddr 0.0.0.0 --rpcport 8575 --rpcvhosts "*" --unlock "${wallet13}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/14 --networkid 51 --port 30316 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8568 --rpcaddr 0.0.0.0 --rpcport 8576 --rpcvhosts "*" --unlock "${wallet14}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/15 --networkid 51 --port 30317 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8569 --rpcaddr 0.0.0.0 --rpcport 8577 --rpcvhosts "*" --unlock "${wallet15}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/16 --networkid 51 --port 30318 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8570 --rpcaddr 0.0.0.0 --rpcport 8578 --rpcvhosts "*" --unlock "${wallet16}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/17 --networkid 51 --port 30319 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8571 --rpcaddr 0.0.0.0 --rpcport 8579 --rpcvhosts "*" --unlock "${wallet17}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS &
child_proc="$child_proc $!"
${PROJECT_DIR}/build/bin/$Bin_NAME --bootnodes "enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@127.0.0.1:30301" --syncmode "full" --datadir ./nodes/18 --networkid 51 --port 30320 --rpc --rpccorsdomain "*" --ws --wsaddr="0.0.0.0" --wsorigins "*" --wsport 8572 --rpcaddr 0.0.0.0 --rpcport 8580 --rpcvhosts "*" --unlock "${wallet18}" --password ./.pwd --mine --gasprice "${GASPRICE}" --targetgaslimit "42000000000000" --verbosity ${VERBOSITY} --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,XDPoS  
