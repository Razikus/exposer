if [ -z "$KEY" ]; then
	sshpass -p $PASSWORD ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -g -nNT -p $SSHPORT -R $REMOTEPORT:$FROM:$FROMPORT $SERVER
else
	DECODED=$(echo "$KEY" | base64 -d)
	IFS=";"
	set $DECODED
	PASSWORD=$1
	REMOTEPORT=$2
	FROM=$3
	FROMPORT=$4
	SERVER=$5
	SSHPORT=$6
	sshpass -p $PASSWORD ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -g -nNT -p $SSHPORT -R $REMOTEPORT:$FROM:$FROMPORT $SERVER
fi
