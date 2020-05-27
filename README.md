# docker-signal
=====

![Docker](https://github.com/InnovAnon-Inc/docker-signal/workflows/Docker/badge.svg)

[![dockeri.co](https://dockeri.co/image/innovanon/docker-signal)](https://hub.docker.com/r/innovanon/docker-signal/)

Container for running signal-desktop

## don't use signal... at all... ever.
## signal has backdoors in its proprietary libraries
## signal doesn't run in docker
## signal doesn't run on iPhone
## do you need more reasons?

# error:
docker run --rm --name docker-signal --net=host -e DISPLAY=:0 -t docker-signal
bwrap: No permissions to creating new namespace, likely because the kernel does not allow non-privileged user namespaces. On e.g. debian this can be enabled with 'sysctl kernel.unprivileged_userns_clone=1'.
error: ldconfig failed, exit status 256

## Build with
docker build -t signal signal

## Run with
docker run --rm -d -v /tmp/.X11-unix/:/tmp/.X11-unix -v $HOME/container-home:/root -e DISPLAY -e XAUTHORITY -v $XAUTHORITY:$XAUTHORITY --net=host signal

You will need a directory called 'container-home' in your home directory
for storing state.
