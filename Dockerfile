FROM ubuntu:18.04
MAINTAINER marcosvanetta@gmail.com


RUN apt-get update -q
RUN apt-get install -y cmake build-essential libboost-regex-dev libicu-dev libboost-system-dev libboost-program-options-dev libboost-thread-dev zlib1g automake autoconf libtool wget locales
RUN apt-get install -y libboost-system1.65.1 libz-dev libboost-filesystem-dev
RUN locale-gen en_US.UTF-8





WORKDIR /tmp
RUN wget https://github.com/TALP-UPC/FreeLing/releases/download/4.2/FreeLing-src-4.2.tar.gz
RUN tar xvzf FreeLing-src-4.2.tar.gz
RUN mkdir langs
WORKDIR /tmp/langs
RUN wget https://github.com/TALP-UPC/FreeLing/releases/download/4.2/FreeLing-langs-src-4.2.tar.gz
RUN tar xvzf FreeLing-langs-src-4.2.tar.gz

RUN cp -R /tmp/langs/FreeLing-4.2/data/* /tmp/FreeLing-4.2/data/

WORKDIR /tmp/FreeLing-4.2
RUN mkdir build
WORKDIR /tmp/FreeLing-4.2/build
RUN cmake ..
RUN make install
RUN rm -rf /tmp/*


EXPOSE 50005
ENV FREELINGSHARE /usr/local/share/freeling
#CMD echo 'Hello world' | analyze -f $FREELINGSHARE/config/en.cfg | grep -c 'world world NN 1'
