FROM ubuntu:18.04
USER root
RUN apt-get -qq -y update && \
    apt-get -qq -y install \
       python3 python3-pip openmpi-bin \
       zlib1g-dev libjpeg8-dev 
ENV LC_ALL=C.UTF-8
RUN python3 -m pip install cython && python3 -m pip install ultranest
RUN useradd -m docker
WORKDIR /home/docker
USER docker
CMD bash
