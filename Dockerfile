FROM fedora:36

RUN dnf -y update
RUN dnf -y install vim man
RUN dnf -y install wget curl tmux socat nmap lynx net-tools iputils iproute
RUN dnf -y groupinstall "C Development Tools and Libraries"
RUN dnf -y install git jq ranger zip unzip ncdu fzf pandoc xsel exa zoxide

# Node
RUN dnf -y module install nodejs:16/common
RUN npm install -g clipboard-cli jsonpath-cli
# FIXME: clipboard-cli broken

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

# McFly
RUN curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sh -s -- --git cantino/mcfly
RUN echo -e 'eval \"$(mcfly init bash)\"' >> ~/.bash_profile
RUN echo -e 'export MCFLY_FUZZY=true' >> ~/.bash_profile
# FIXME: McFly broken

# Zoxide
RUN echo -e 'eval "$(zoxide init bash --cmd cd)"' >> ~/.bash_profile

RUN echo -e 'alias ls="exa --time-style=long-iso"' >> ~/.bash_profile
RUN echo -e 'alias lsl="exa --time-style=long-iso --long --header --git"' >> ~/.bash_profile
RUN echo -e 'alias tree="exa --tree --level=3 --long"' >> ~/.bash_profile

RUN echo -e "export PS1='\e[32m\u\e[0m:\e[34m\w\e[0m$ '" >> ~/.bashrc

CMD ["/sbin/init"]
