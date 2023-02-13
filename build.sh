#!/bin/bash

sudo docker build --network=host -f ./ci/Dockerfile-envoy -t envoy .
