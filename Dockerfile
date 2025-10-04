FROM mcr.microsoft.com/devcontainers/base:noble

# NOTE: make sure to set up appropriately for your app

# Install MariaDB client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y mariadb-client \ 
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Install PHP
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
                      php8.3 php8.3-zip php8.3-mysql php8.3-curl php8.3-xml php8.3-gd \
                      composer

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

