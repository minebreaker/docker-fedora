docker rm my-fedora
docker run --privileged -d --name my-fedora -p 127.0.0.1:8080:60080/tcp minebreaker/my-fedora:29 /sbin/init
./exec.cmd
