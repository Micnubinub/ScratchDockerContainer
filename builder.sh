#!/usr/bin/env bash

docker build -t gobuilder .
sudo docker run -v ./dist:/app/dist -p 80:12345 -it --rm gobuilder