FROM ubuntu:16.04
USER root
RUN apt-get -qq -y update && \
    apt-get -qq -y install \
       python-pip python-numpy python-scipy python-pandas \
       libfreetype6-dev python-gtk2-dev python-matplotlib \
       texlive-latex-extra dvipng
# Last version of pip to support python2
# See https://pip.pypa.io/en/stable/development/release-process/#python-2-support
RUN pip install --upgrade pip==20.3.4
RUN pip install appdirs prettytable simpleyaml joblib superplot
RUN useradd -m docker
WORKDIR /home/docker
USER docker
# Avoids various error messages from superplot
RUN mkdir -p .local/share
# Builds font cache
RUN python -c "import matplotlib.font_manager"
CMD bash
