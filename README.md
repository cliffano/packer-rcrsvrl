<img align="right" src="https://raw.github.com/cliffano/packer-rcrsvrl/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://img.shields.io/travis/cliffano/packer-rcrsvrl.svg)](http://travis-ci.org/cliffano/packer-rcrsvrl)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/cliffano/rcrsvrl.svg)](https://hub.docker.com/r/cliffano/rcrsvrl/)

Packer rcrsvrl
---------------

Packer rcrsvrl is a Packer builder of Docker image for TODO.

Installation
------------

Pull rcrsvrl Docker image from Docker Hub:

    docker pull cliffano/rcrsvrl

Or alternatively, you can create the Docker image:

    git clone https://github.com/cliffano/packer-rcrsvrl
    cd packer-rcrsvrl
    make docker

An image with `cliffano/rcrsvrl` repository and `latest` tag should show up:

    haku> docker images

    REPOSITORY                                       TAG                 IMAGE ID            CREATED             SIZE
    cliffano/rcrsvrl                                  latest              3f45c1bc0e76        5 hours ago         1.5GB
    ubuntu                                           latest              735f80812f90        2 weeks ago         83.5MB

Usage
-----

Simply run a container using cliffano/rcrsvrl image:

    docker run \
      --rm \
      --workdir /opt/workspace \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $(pwd):/opt/workspace \
      -i -t cliffano/rcrsvrl
