FROM debian:trixie-slim
ARG DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.authors="SoapiestWaffles"
LABEL org.opencontainers.image.url="https://github.com/soapiestwaffles/docker-awskubectl"

# Install AWS CLI v2 && kubectl
RUN apt update && apt install curl unzip groff less -y && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf ./aws && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    apt purge curl unzip && \
    rm -rf /var/lib/apt/lists/*
    

