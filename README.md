# docker-esp-open-sdk
Dockerfile for https://github.com/pfalcon/esp-open-sdk

Available here: https://hub.docker.com/r/jedie/esp-open-sdk

```
$ docker run -it jedie/esp-open-sdk:latest /bin/bash
root@c3b6eac05bbf:/# ls -la opt/xtensa-lx106-elf/
total 792
drwxr-xr-x 8 root root    116 Dec 30 08:27 .
drwxr-xr-x 1 root root     30 Dec 30 08:27 ..
drwxrwxr-x 2 1000 1000   4096 Dec 30 08:26 bin
-rw-rw-r-- 1 1000 1000 805416 Dec 30 08:26 build.log.bz2
drwxrwxr-x 3 1000 1000     17 Dec 30 08:26 include
drwxrwxr-x 4 1000 1000     34 Dec 30 08:25 lib
drwxrwxr-x 3 1000 1000     17 Dec 30 08:25 libexec
drwxrwxr-x 4 1000 1000     34 Dec 30 08:26 share
drwxrwxr-x 6 1000 1000    102 Dec 30 08:23 xtensa-lx106-elf
root@c3b6eac05bbf:/# ./opt/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc --version
xtensa-lx106-elf-gcc (crosstool-NG crosstool-ng-1.22.0-60-g37b07f6f) 4.8.5
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```
