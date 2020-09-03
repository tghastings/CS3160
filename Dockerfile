FROM ubuntu:20.04

# Run apt update first
RUN \
  apt-get update && apt install -y \
  curl default-jre

# Install second order dependencies
RUN \ 
  apt-get install -y \
  default-jdk haskell-platform git

# Install vscode
RUN \
  curl -fsSL https://code-server.dev/install.sh | sh

RUN \ 
    mkdir -p /root/.local/share/code-server/extensions/mnxn.jvm-bytecode-viewer-0.3.0

COPY vscode-jvm-bytecode-viewer /root/.local/share/code-server/extensions/mnxn.jvm-bytecode-viewer-0.3.0

CMD /usr/bin/code-server --auth none --port 80 --host 0.0.0.0

EXPOSE 80