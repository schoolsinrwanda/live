FROM debian:latest

RUN apt update && apt install -y ffmpeg python3 python3-pip python3-flask

WORKDIR /app
COPY . /app

EXPOSE 8080

CMD ["./start.sh"]
