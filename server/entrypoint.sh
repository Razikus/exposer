#!/bin/bash
if [ ! -f /done ]; then
	ssh-keygen -A
	echo -e "$PASSWORD\n$PASSWORD" | passwd exposer
	touch /done
fi
echo "Starting sshd"
/usr/sbin/sshd -D
