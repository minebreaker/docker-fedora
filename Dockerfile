FROM fedora:34

RUN dnf -y update
RUN dnf -y install vim man
RUN dnf -y install wget curl tmux socat nmap lynx net-tools iputils iproute
RUN dnf -y install java-1.8.0-openjdk-devel
RUN dnf -y groupinstall "C Development Tools and Libraries"
RUN dnf -y install nodejs npm
RUN dnf -y install git jq ranger unzip ncdu

RUN echo -e "\nalias python=python3\n" >> /root/.bashrc

RUN mkdir ~/bin
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > ~/bin/lein
RUN chmod a+x ~/bin/lein
RUN ~/bin/lein

# Stack & GHC

RUN echo -e "export PS1='\e[32m\u\e[0m:\e[34m\w\e[0m$ '" >> /root/.bashrc

CMD ["/sbin/init"]
