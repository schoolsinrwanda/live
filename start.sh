#!/bin/bash
python3 server.py &

while true; do
    ffmpeg -re -stream_loop -1 -i strea.mp4 \
-c:v libx264 -preset veryfast -g 120 -keyint_min 120 \
-b:v 1000k -maxrate 1000k -bufsize 2000k \
-vf "scale=720:1280:flags=lanczos" \
-pix_fmt yuv420p -profile:v high -level 4.0 \
-c:a aac -ar 44100 -b:a 128k -ac 2 \
-f flv rtmp://a.rtmp.youtube.com/live2/c35y-6fmx-crep-buu7-7w1h
done
