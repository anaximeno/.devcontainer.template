FROM mcr.microsoft.com/devcontainers/base:noble

# NOTE: make sure to set up appropriately for your app

# Install MariaDB client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y default-libmysqlclient-dev pkg-config \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Install Dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        wget python3 python3-pip python3-venv curl git unzip \
        xz-utils zip libglu1-mesa clang cmake ninja-build libgtk-3-dev mesa-utils \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Flutter
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.7-stable.tar.xz \
    && tar xf flutter_linux_3.35.7-stable.tar.xz \
    && mv flutter /opt/flutter \
    && rm flutter_linux_3.35.7-stable.tar.xz

# Add Flutter to PATH
ENV PATH="/opt/flutter/bin:${PATH}"

# Consider adding miniconda?
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda \
    && rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH="/opt/miniconda/bin:${PATH}"
RUN conda init bash
RUN conda init zsh
