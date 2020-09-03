FROM ubuntu:20.04

COPY mnxn.jvm-bytecode-viewer-0.3.0.vsix /root/mnxn.jvm-bytecode-viewer-0.3.0.vsix

# Run apt update first
RUN \
  apt-get update && apt install -y \
  curl default-jre

# Install second order dependencies
RUN \ 
  apt-get install -y \
  default-jdk haskell-platform 

# Install vscode
RUN \
  curl -fsSL https://code-server.dev/install.sh | sh

CMD /usr/bin/code-server --auth none --port 80 --host 0.0.0.0

EXPOSE 80