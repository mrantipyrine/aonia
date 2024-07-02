FROM ubuntu:latest

# Install necessary packages
RUN apt update && \
    apt install -y \
    git \
    python3 \
    python3-pip \
    g++-10 \
    cmake \
    make \
    libluajit-5.1-dev \
    libzmq3-dev \
    libssl-dev \
    zlib1g-dev \
    mariadb-server \
    libmariadb-dev \
    binutils \
    binutils-dev

ENV LD_LIBRARY_PATH=/usr/local/lib

# Set the entry point
ENTRYPOINT ["tail", "-f", "/dev/null"]
