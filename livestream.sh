#!/usr/bin/env sh
directory="/hdd/Vídeos/wallpapers/"
video=$(ls $directory |sort -R |tail -n1)
mpv --loop-file=inf --no-audio --wid=$1 $directory$video
