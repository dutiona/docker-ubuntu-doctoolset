FROM ubuntu:bionic
LABEL maintainer="Michaël Roynard <mroynard@lrde.epita.fr>"

ENV container docker
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install all pkg
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get dist-upgrade -y && apt-get upgrade -y
RUN apt-get install -y \
    build-essential binutils git ninja-build cmake python python3 python-pip python3-pip
RUN apt-get install -y \
    texlive-full
RUN apt-get install -y \
    htmldoc pandoc npm doxygen graphviz tree
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get autoclean -y && rm -rf /var/lib/apt/lists/

RUN npm install -g markdown-pdf

# Install python packages
RUN echo y | pip install -U pip six wheel setuptools
RUN echo y | pip install sphinx breathe exhale sphinx_rtd_theme
RUN echo y | pip3 install -U pip six wheel setuptools
RUN echo y | pip3 install sphinx breathe exhale sphinx_rtd_theme

WORKDIR /workspace

CMD ["/bin/bash"]
