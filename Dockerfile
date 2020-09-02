  
FROM ubuntu:20.04

# Install first order dependencies
RUN \
  apt update && \
  apt install -y \
  curl default-jre 

# Install second order dependencies
RUN \ 
  apt install -y \
  default-jdk

# Install vscode
RUN \
  curl -fsSL https://code-server.dev/install.sh | sh

CMD /usr/bin/code-server --auth none --port 80 --host 0.0.0.0

EXPOSE 80