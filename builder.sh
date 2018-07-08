#!/usr/bin/env bash

sudo docker build -t gobuilder .
sudo docker run  --mount type=bind,source="$(pwd)"/dist,target=/app/dist -p 80:12345 -it --rm gobuilder