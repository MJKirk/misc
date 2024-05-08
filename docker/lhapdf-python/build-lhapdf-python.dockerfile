# Mostly stolen from https://github.com/matthewfeickert/pythia-python
=> MIT License
   Copyright (c) 2020 Matthew Feickert
                 2024 Matthew Kirk

FROM python:3.11-bullseye as build-stage
ARG LHAPDF_VERSION=6.5.4
RUN mkdir /code /lhapdf-build && \
    cd /code && \
    wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-${LHAPDF_VERSION}.tar.gz -O LHAPDF-${LHAPDF_VERSION}.tar.gz && \
    tar xvfz LHAPDF-${LHAPDF_VERSION}.tar.gz && \
    cd LHAPDF-${LHAPDF_VERSION} && \
    export PYTHON=$(command -v python) && \
    ./configure --prefix=/lhapdf-build && \
    make -j$(nproc --ignore=1) && \
    make install && \
    rm -rf /code && \
    cp -P /usr/local/lib/libpython3.11* /lhapdf-build/lib

FROM scratch
COPY --from=build-stage /lhapdf-build /
