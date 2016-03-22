Cloud9 IDE container with NVM
=============================

Cloud9 IDE SDK container with git, python, nvm and node LTS (4.2) installed, with the *typescript* and *typings* modules.

To build the container:

```
git clone https://github.com/rjrivero/docker-c9-node
cd docker-c9-node

# To build the x86 version
docker build --rm -t c9-node .
```

To run:

```
docker run --rm -p 8080:8080 -p 3000:3000 \
           -v </my/node/app/folder>:/home/c9/dev \
           -v </my/static/content/folder>:/home/c9/www \
           -e C9_PASSWORD=mypassword \
           --name c9-node c9-node
```

Volumes
-------

The container is intended to provide a node development environment with the Cloud9 IDE. By convention, your node app should be installed under **/home/c9/dev**, and any static resources you want to serve should be under **/home/c9/www**

However, this container does not include any http server. It relies on an external http server to serve the static content and proxy the application port.

The volumes should be writable by user **c9**, which has **uid 1000** and **gid 1000**.

Environment Variables
---------------------

The container accepts a single environment variable, **C9_PASSWORD**, with the password for the cloud9 default *admin* user.

Ports
-----

The container exposes the c9 IDE at port **8080**, and your node app at port **3000**.
