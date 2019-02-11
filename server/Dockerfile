FROM alpine:3.8
RUN apk add openssh 
COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config
ENV PASSWORD=root!root 
RUN adduser -S exposer
EXPOSE 9999
ENTRYPOINT /bin/sh /usr/bin/entrypoint
