This repository contains Dockerfile of the Code IDE running on Ubuntu Linux for Docker's automated build published to the public Docker Hub Registry.

# Step 1: Docker Installation

## Windows

### Windows Pro / Education Editions

    https://docs.docker.com/docker-for-windows/install/

### Windows Home

    https://docs.docker.com/docker-for-windows/install-windows-home/

## MacOS

    https://docs.docker.com/docker-for-mac/install/

## Linux

### CentOS

    https://docs.docker.com/install/linux/docker-ce/centos/

### Debian

    https://docs.docker.com/install/linux/docker-ce/debian/

### Fedora

    https://docs.docker.com/install/linux/docker-ce/fedora/

### Ubuntu

    https://docs.docker.com/install/linux/docker-ce/ubuntu/

### Binaries

    https://docs.docker.com/install/linux/docker-ce/binaries/

# Step 2: Pull Image

Download automated build from public Docker Hub Registry:

    docker pull tghastings/cs3160

# Step 3: Running

    docker run -d -p 80:80 tghastings/cs3160

You can mount a directory as a volume with the argument \*-v /your-path/directory/:/root/ like this :

    docker run -d -p 80:80 -v /your-path/local/working/directory/:/root/environment tghastings/cs3160

# Step 4: Accessing the IDE

## Windows, MacOS, & Linux

    http://localhost