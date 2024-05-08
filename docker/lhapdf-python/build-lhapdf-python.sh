#!/bin/sh

DOCKER_BUILDKIT=1 \
docker build --output type=tar,dest=lhapdf654-python311-new.tar -t lhapdf-python:654-311 \
-f build-lhapdf-python.dockerfile .
