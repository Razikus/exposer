docker run -p 8080:22 -p 80:9999 --restart=always --name exposerserver -e PASSWORD=supersecretpassword -d razikus/exposerserver:1.0
