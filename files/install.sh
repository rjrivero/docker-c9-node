#!/usr/bin/env bash

export C9_HOME=/home/c9
cd ${C9_HOME}

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash
export NVM_DIR=${C9_HOME}/.nvm 
. ${NVM_DIR}/nvm.sh

# Install node
nvm install ${NODE_VERSION}
echo ${NODE_VERSION} > ${C9_HOME}/.nvmrc
nvm alias default ${NODE_VERSION}

# Install typescript development libs
nvm use ${NODE_VERSION}
npm install -g npm@latest
npm install typescript
npm install @types/node
npm install typings
