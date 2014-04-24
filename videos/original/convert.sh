#!/bin/sh

echo "Original file name is: $1"

webm_file="${1/MP4/webm}"
mp4_file="${1/MP4/mp4}"

echo "WebM file name is: $webm_file"

echo "MP4 file name is: $mp4_file"

# WebM
echo "Creating WebM file at 720p"
ffmpeg -i $1 -r 30000/1001 -vcodec libvpx -s 1280x720 -b 1024k -bt 128k -an ../webm-720/$2.webm

# H264 Files
echo "Creating H264 at 1020p"
ffmpeg -i $1 -r 30000/1001 -vcodec libx264 -s 1920x1080 -b 2048k -bt 128k -an ../h264-1080/$2.mp4
echo "Creating H264 at 1020p"
ffmpeg -i $1 -r 30000/1001 -vcodec libx264 -s 1280x720  -b 1024k -bt 128k -an ../h264-720/$2.mp4
echo "Creating H264 at 1020p"
ffmpeg -i $1 -r 30000/1001 -vcodec libx264 -s 640x360   -b 512k  -bt 128k -an  ../h264-360/$2.mp4
echo "All Done!"