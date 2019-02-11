# exposer
Expose your services without public ip!

---
# TL;DR
Exposer allows to expose your local/hided services in the internet.
The only requirement is to have internet connection, and from your host the host that you are exposing must be available.

So for example - you have your device/soft that is exposing port 80, but you have no public ip on this device/can't share cause of hard router configuration, etc.

With exposer you can forward your traffic over tunnel between server and client.
So any request to remote port will be forwarded to listening client. Simple, right?
Of course this is not my solution - this is builded in SSH.


This is based on pure ssh, i think that it resolving lot of problem and i've decided to make this open source.

# Server usage
Server is just containerized sshd server with enabled port forwarding.
On your server you can make the container with command:
```
docker run -p 8080:22 -p 80:9999 --restart=always --name exposerserver -e PASSWORD=supersecretpassword -d razikus/exposerserver:1.0
```
This will expose your exposerserver on ssh port 8080 and port 80 from inside port 9999 with password supersecretpassword.
Your server should be public if you want to public expose ports. 
Any client can connect now.

# Client usage
Let's assume, that server ip was 53.53.53.53

```
docker run --network=host -e PASSWORD=supersecretpassword -e SERVER=exposer@53.53.53.53 -e SSHPORT=8080 -e REMOTEPORT="\*:9999" -e FROM=localhost -e FROMPORT=8081 --restart=always -d razikus/exposerclient:1.0
```
This will try to expose service localhost:8081 from your network to public server 53.53.53.53 on port 9999. But 9999 was exposed to 80 in server container so the real exposure will be 53.53.53.53:80. Of course you can adjust it on what you want.

More cases in client examples.

# exposer.eu usage
This is really simple service that i've builded for you to allow you expose the applications. 

Go to page http://exposer.eu/test/80/localhost
This will create for you a bunch of example command to expose on domain test.exposer.eu your http://localhost:80
You can use then SSH command that is generated or just use docker command that i also provided.

exposer.eu for now is working only with http requests. Don't worry - you can still expose your SSH with gotty (look at examples)

Limitations: if somebody will choose the same domain as you it will be overriden.
Any abuse of law will be reported & banned.

If there will be too much abuses i will just close this service.

If you want to have persistent domain in exposer.eu, or you want to connect your domain, please contact me on support@razniewski.eu - it cost 2€ per month.

And of course - any donate is really approciated.


# Who is using this?
For example me, my company and my devices Skryba-1 (time and attendance registrator). So every client can just provide the key that i'm selling, and device will be exposed in the internet.

# Donate

Just buy me a coffee! It's very motivating :D

https://www.buymeacoffee.com/razikus

[<img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png">](https://www.buymeacoffee.com/razikus)


Or donate over PayPal:
https://paypal.me/arosoftware



License
----

MIT



[![N|Solid](https://sklep.razniewski.eu/wp-content/uploads/2018/11/cropped-logs.png)](https://razniewski.eu)
