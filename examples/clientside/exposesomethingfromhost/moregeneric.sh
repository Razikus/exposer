#!/bin/bash

PASSWORD=$1
SERVER=$2
SSHPORT=$3
REMOTEPORT=$4
FROM=$5
FROMPORT=$6
docker run --network=host -e PASSWORD=$PASSWORD -e SERVER=$SERVER -e SSHPORT=$SSHPORT -e REMOTEPORT="$REMOTEPORT" -e FROM=$FROM -e FROMPORT=$FROMPORT --restart=always -d razikus/exposerclient:1.0
