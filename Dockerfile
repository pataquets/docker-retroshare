FROM pataquets/ubuntu:xenial

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  . /etc/lsb-release && \
  echo "deb http://ppa.launchpad.net/retroshare/stable/ubuntu ${DISTRIB_CODENAME} main" \
    | tee /etc/apt/sources.list.d/retroshare.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 144729B5

RUN \
  apt-get update && \
  apt-get -y install retroshare && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "retroshare-nogui", "--stderr", "--ip-address", "0.0.0.0" ]
