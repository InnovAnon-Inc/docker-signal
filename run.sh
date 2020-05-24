#! /bin/bash
set -exu

command -v docker ||
curl https://raw.githubusercontent.com/InnovAnon-Inc/repo/master/get-docker.sh | bash

sudo             -- \
nice -n +20      -- \
sudo -u `whoami` -- \
docker build -t innovanon/docker-signal .

docker push innovanon/docker-signal:latest || :

docker volume inspect signalvol ||
docker volume create  signalvol

#docker run --rm --name docker-signal      \
#	--net=host -e DISPLAY=${DISPLAY}  \
#	-v /tmp/.X11-unix/:/tmp/.X11-unix \
#	-v signalvol:/home/signal-user    \
#	-e XAUTHORITY                     \
#	-v $XAUTHORITY:$XAUTHORITY        \
#	-t docker-signal

sudo             -- \
nice -n +20      -- \
sudo -u `whoami` -- \
docker run --rm --name docker-signal      \
	--net=host -e DISPLAY=${DISPLAY}  \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v signalvol:/root                \
	-e XAUTHORITY                     \
	-v $XAUTHORITY:$XAUTHORITY        \
	-t innovanon/docker-signal

