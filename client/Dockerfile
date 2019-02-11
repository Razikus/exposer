FROM alpine:3.8
RUN apk add autossh sshpass
ENV PASSWORD=root 
ENV REMOTEPORT=80 
ENV FROM=localhost 
ENV FROMPORT=80 
ENV SERVER=root@server 
ENV SSHPORT=30000 
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT sh /entrypoint.sh
