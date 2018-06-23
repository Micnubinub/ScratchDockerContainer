#!/usr/bin/env bash

docker build -t gobuilder .
sudo docker run -it --rm gobuilder
