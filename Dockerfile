FROM alpine:3.12.0

WORKDIR /usr/src/app

ENV RCLONE_V=1.52.2 
RUN apk update \
    && apk add openssl ca-certificates fuse tzdata \
    && cd /tmp \
    && wget -q https://downloads.rclone.org/v${RCLONE_V}/rclone-v${RCLONE_V}-linux-amd64.zip \
    && unzip /tmp/rclone-v${RCLONE_V}-linux-amd64.zip \
    && mv /tmp/rclone-v${RCLONE_V}-linux-amd64/rclone /usr/bin \
    && rm -r /tmp/rclone* \
    && cp /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime \
    && echo "America/Buenos_Aires" > /etc/timezone \
    && apk del tzdata 

COPY . .

RUN mkdir -p log \
    && touch log/cron.log \
    && mkdir -p backup \
    && mkdir -p backup/src/incremental \
    && mkdir -p backup/full \
    && chmod 744 -R scripts

CMD ["./scripts/init.sh"]