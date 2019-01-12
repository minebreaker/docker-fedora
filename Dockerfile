FROM fedora:29

RUN dnf -y upgrade
RUN dnf -y update
RUN dnf -y install java-1.8.0-openjdk-devel
RUN dnf -y install wget curl vim man tmux unzip git jq lynx socat ranger

RUN alias python=python3

CMD ["/sbin/init"]
