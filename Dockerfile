FROM debian:9
ENV CODENAME xenial
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get update && apt-get install -y \
	build-essential \
	wget


RUN mkdir /out
VOLUME /out/

RUN apt-get update && apt-get install -y debhelper rsync libmodule-build-perl libtest-script-perl libmonitoring-plugin-perl libwww-perl libjson-perl

COPY . /build/
WORKDIR /build/

CMD set -x; dpkg-buildpackage && cp /*.deb /out
