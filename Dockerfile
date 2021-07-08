FROM fedora:34

RUN dnf -y update
RUN dnf -y install vim man
RUN dnf -y install wget curl tmux socat nmap lynx net-tools iputils iproute
RUN dnf -y groupinstall "C Development Tools and Libraries"
RUN dnf -y install git jq ranger zip unzip ncdu fzf pandoc xsel exa

# Node
RUN dnf -y module install nodejs:14/default
RUN npm install -g clipboard-cli

# SDKMAN
RUN curl -s "https://get.sdkman.io" | bash
# FIXME: specify version
RUN source "/root/.sdkman/bin/sdkman-init.sh" && sdk install java
ENV PATH ${PATH}:/root/.sdkman/candidates/java/current/bin

# Leiningen
RUN mkdir ~/bin
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > ~/bin/lein
RUN chmod a+x ~/bin/lein
RUN ~/bin/lein

# Stack & GHC
RUN curl -sSL https://get.haskellstack.org/ | sh

RUN echo -e "export PS1='\e[32m\u\e[0m:\e[34m\w\e[0m$ '" >> /root/.bashrc

CMD ["/sbin/init"]
