#!/bin/bash
set -e

if [ -f /mnt/installed ]; then
	exec /opt/minimserver/bin/startc
else
	wget -O /opt/MinimServer.tar.gz "http://jminim.com/cada/MinimServer-0.8.5.2-linux-armhf.tar.gz"
	cd /opt
	tar xf MinimServer.tar.gz
	rm MinimServer.tar.gz
	cd minimserver/opt/bin
	mkdir tmp
	wget -O tmp/ffmpeg.tar.xz "https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-armhf-static.tar.xz"
	tar xf tmp/ffmpeg.tar.xz --strip 1 -C tmp
	mv tmp/ffmpeg .
	rm -rf tmp
	# setting server properties
	/opt/minimserver/bin/startc &
	sleep 10s
	/opt/minimserver/bin/mscript /mnt/properties.txt
	touch /mnt/installed
	exit 0
	# container should restart now
fi
