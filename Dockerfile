# step 1: build esp-open-sdk from source
FROM ubuntu:18.04 as builder

ENV TERM=xterm \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  make unrar-free autoconf automake libtool gcc g++ gperf \
  flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
  sed git unzip bash help2man wget bzip2 libtool-bin

RUN groupadd -g 1000 docker && useradd docker -u 1000 -g 1000 -s /bin/bash --no-create-home \
    && mkdir /build \
    && chown docker:docker /build/ \
    && cd /build/ \
    && su docker -c "git clone --depth=1 --recursive https://github.com/pfalcon/esp-open-sdk.git"

# build doesn't work as root, e.g.:
#   ake[2]: Entering directory '/esp-open-sdk/crosstool-NG'
#   [ERROR]  You must NOT be root to run crosstool-NG
# So we add the normal user 'docker' and use him:
RUN cd /build/esp-open-sdk/ \
    && su docker -c "make STANDALONE=n"


# step 2: copy result to new docker image => reduce the image's size
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y make python python-serial

COPY --from=builder /build/esp-open-sdk/xtensa-lx106-elf /opt/xtensa-lx106-elf

ENV PATH /opt/xtensa-lx106-elf/bin:$PATH
