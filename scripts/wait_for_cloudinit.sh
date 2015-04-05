#!/bin/bash
echo -n "Waiting for cloud-init to finish: "
while sudo pkill -0 cloud-init; do sleep 2; echo -n "."; done
echo " done."

