FROM alpine:latest

RUN apk add --no-cache curl unzip

RUN mkdir -p /etc/v2ray /usr/bin
RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.42.0/v2ray-linux-64.zip
RUN unzip /tmp/v2ray.zip -d /tmp/v2ray && \
    mv /tmp/v2ray/v2ray /usr/bin/v2ray && \
    chmod +x /usr/bin/v2ray && \
    rm -rf /tmp/v2ray*

COPY config.json /etc/v2ray/config.json

EXPOSE 8080

CMD ["v2ray", "run", "-config", "/etc/v2ray/config.json"]
