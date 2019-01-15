FROM fedora:29

RUN dnf -y upgrade
RUN dnf -y update
RUN dnf -y install vim man
RUN dnf -y install wget curl tmux unzip lynx socat
RUN dnf -y install java-1.8.0-openjdk-devel
RUN dnf -y groupinstall "C Development Tools and Libraries"
RUN dnf -y install git jq ranger

RUN echo -e "\nalias python=python3\n" >> /root/.bashrc

RUN mkdir ~/bin
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > ~/bin/lein
RUN chmod a+x ~/bin/lein
RUN ~/bin/lein

CMD ["/sbin/init"]
