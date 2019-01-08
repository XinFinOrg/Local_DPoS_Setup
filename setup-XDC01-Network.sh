#!/bin/bash

# Auther :- Anil Chinchawale
# AutherEmailID :- anil@xinfin.org
# Setup XDC01 blockchain with single script

echo "[*] Init XinFin DPoS Network"

echo "[*] Please enter Project/Network name :- "
read project_name

echo "[*]Specify your chain/network ID if you want an explicit one (default = random)"
read network_id

PROJECT_ROOT_DIR=${project_name}_network
PROJECT_CUSTOM_GENESIS_FILE=${project_name}_genesis.json

mkdir $PROJECT_ROOT_DIR
cd $PROJECT_ROOT_DIR
mkdir logs

echo "[*] Please enter no. of inital nodes you wish to setup (min. 3) :- "
read numMN

if [[ $numMN > 21 ]]
then
    echo "Current Count ${numMN} , MasterNodes Count should not exceed more then 21..!"
    exit 1
fi

echo "[*] Creating ${numMN} nodes"

