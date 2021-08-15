#!/bin/bash

# This script will be triggered by deployment pipeline to upgrade the node versions to match the provided git commit
# export XINFIN_PATH='/root/XinFin/'
export XINFIN_PATH='/Users/Jerome/hashlab'
export DOCKER_HUB='wjrjerome/hashlab-testing-1.0' # TODO: replace with XINFIN docker hub
export DOCKER_TAG=$1
export BOOTNODE='enode://1c20e6b46ce608c1fe739e78611225b94e663535b74a1545b1667eac8ff75ed43216306d123306c10e043f228e42cc53cb2728655019292380313393eaaf6e23@172.19.255.255:30301'
export NETWORK_LEVEL=551


# Kill and clean docker
echo "Cleaning old docker containers and images"
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi -f $(docker images -a -q)

# Swtich to XDPoS repo
echo "---------Pulling new docker image---------"
echo "Pulling $DOCKER_HUB:$DOCKER_TAG"
docker pull $DOCKER_HUB:$DOCKER_TAG

cd $XINFIN_PATH/Local_DPoS_Setup
export $(xargs < .env)
docker-compose -f devnet/docker-compose.yml config && docker-compose -f devnet/docker-compose.yml up


# (cd $XINFIN_PATH/XDPoSChain && git pull && git checkout $DOCKER_TAG && make clean && make all && make XDC)

# PIDS=$(ps aux |grep XDC | awk -v FS=" " '{print $2}')