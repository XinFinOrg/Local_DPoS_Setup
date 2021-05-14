#!/bin/bash
rm -rf ./nodes
rm -rf ./logs/*
for i in `ps aux |grep XDC | awk -v FS=" " '{print $2}' `; do kill -9 $i || true; done 