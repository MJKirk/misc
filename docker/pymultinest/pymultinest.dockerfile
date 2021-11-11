FROM ubuntu:18.04
USER root
RUN apt-get -qq -y update && \
    apt-get -qq -y install \
       git cmake g++ gfortran \
       python3 python3-pip \
       libblas3 libblas-dev liblapack3 liblapack-dev \
       openmpi-bin libopenmpi-dev
ENV LC_ALL=C.UTF-8
RUN python3 -m pip install pymultinest mpi4py
RUN useradd -m docker
WORKDIR /home/docker
USER docker
RUN git clone https://github.com/JohannesBuchner/MultiNest && \
    cd MultiNest/build && cmake .. && make
ENV LD_LIBRARY_PATH=/home/docker/MultiNest/lib
COPY mcmc_run.py .
COPY run-script.sh .
# requirements.txt and my_fit_code.py are the files you customise
COPY requirements.txt .
RUN python3 -m pip install --user -r requirements.txt
COPY my_fit_code.py .
ENTRYPOINT [ "/bin/bash", "run-script.sh" ]
CMD ["4"]
