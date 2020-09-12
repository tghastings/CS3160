FROM ubuntu:20.04
ENV SHELL /bin/bash

# Run apt update first
RUN \
  apt update && apt install -y \
  curl default-jre

# Install second order dependencies
RUN \ 
  apt install -y \
  default-jdk haskell-platform git vim g++ gcc python rustc golang perl nodejs emacs sbcl gfortran-9 build-essential

# lisp
RUN \
  curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp && \ 
  sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
       --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
       --eval '(ql:add-to-init-file)' \
       --quit 
  
# Install mono-complete for C sharp and F sharp
RUN \
  apt install -y dirmngr gnupg apt-transport-https ca-certificates && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  sh -c 'echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list'

RUN \
  apt update && \
  apt install -y mono-complete monodevelop monodevelop-nunit

# Install vscode
RUN \
  curl -fsSL https://code-server.dev/install.sh | sh

#COPY *.vsix /root/

CMD /usr/bin/code-server --auth none --port 80 --host 0.0.0.0

EXPOSE 80
