#!/bin/bash
python3 server.py &

while true; do
 ffmpeg -re -stream_loop -1 -i streadd.mp4 \
-c:v libx264 -preset superfast -g 60 -keyint_min 60 \
-b:v 800k -maxrate 800k -bufsize 1600k \
-vf "scale=720:1280:flags=lanczos" \
-pix_fmt yuv420p -profile:v high -level 4.0 \
-c:a aac -ar 44100 -b:a 128k -ac 2 \
-f flv rtmp://a.rtmp.youtube.com/live2/eqxa-djk3-cc2d-gsat-453z
done
