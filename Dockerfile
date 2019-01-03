FROM ubuntu:trusty-20180112

MAINTAINER Erwin "m9207216@gmail.com"


# https://github.com/sameersbn/docker-ubuntu/blob/14.04/Dockerfile
RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends

RUN apt-get update

# for 32bit
#RUN dpkg --add-architecture i386

# i.MX_Yocto_Project_User's_Guide_Linux.pdf
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gawk wget git-core diffstat unzip texinfo \
 gcc-multilib build-essential chrpath socat libsdl1.2-dev
# Ubuntu 14.04
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libsdl1.2-dev xterm sed cvs subversion coreutils texi2html \
 docbook-utils python-pysqlite2 help2man make gcc g++ desktop-file-utils \
 libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf automake groff curl lzop asciidoc

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y u-boot-tools
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN locale-gen en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 -r aosp
RUN useradd -u 1000 --create-home -r -g aosp aosp
USER aosp
RUN git config --global user.email "aosp@example.com"
RUN git config --global user.name "aosp"
ENV LANG en_US.UTF-8

RUN [ "/bin/bash" ]
