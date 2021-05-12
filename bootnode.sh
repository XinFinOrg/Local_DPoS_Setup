#!/bin/bash
source .env

echo Starting the bootnode ...
${PROJECT_DIR}/build/bin/bootnode -nodekey ./bootnode.key --addr 0.0.0.0:30301
child_proc=$!