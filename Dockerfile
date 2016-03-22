FROM rjrivero/c9

# Heavily borrowed from
# https://github.com/eugeneware/docker-wordpress-nginx/blob/master/Dockerfile
MAINTAINER Rafael Rivero <private@email.com>

# NVM version
ENV NVM_VERSION 0.31.0

# Node version to install
# 4.2 current LTS
ENV NODE_VERSION 4.2

# Add install script
ADD files/install.sh /tmp/install.sh

# Install nvm, node, typescript
RUN cd /home/c9 && \
    /sbin/setuser c9 /tmp/install.sh \
    rm -f /tmp/install.sh

# Volumes for development pages and apps
VOLUME ["/home/c9/dev", "/home/c9/www"]

EXPOSE 3000
