#!/bin/bash
echo "Waiting for cloud-init to finish"
START=$(date +%s)
while sudo pkill -0 cloud-init; do
    sleep 2;
    NOW=$(date +%s)
    DIFF=$(bc $NOW-$START)
    echo "Waited for cloud-init: $DIFF seconds"
done
echo "cloud-init is done."

