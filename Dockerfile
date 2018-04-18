FROM alpine:latest

ADD fs_server.zip /fs_server.zip
RUN apk update \
    && apk add python libsodium unzip wget iptables libcap libcap-dev openjdk8-jre nodejs nodejs-npm \
    && rm -rf /var/cache/apk/* \
    && mkdir /ssr \
    && cd /ssr \
    && wget --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/akkariiin/dev.zip -O /tmp/dev.zip \
    && unzip -d /tmp /tmp/dev.zip \
    && mv /tmp/shadowsocksr-akkariiin-dev/shadowsocks /ssr/shadowsocks \
    && rm -rf /tmp/* \
    && cd / \
    && unzip -o fs_server.zip -d /fs \ 
    && apk del  wget  unzip

#COPY config.json /config.json
COPY dns.conf /ssr/shadowsocks/dns.conf

EXPOSE 17519/udp
EXPOSE 17518/udp
EXPOSE 17520/tcp
#EXPOSE 8766

ADD start.sh /start.sh
RUN chmod 755 /start.sh
RUN wget https://github.com/kevinljh11/shadowsocks/raw/rm/server_linux_amd64 -O /server_linux_amd64
RUN chmod +x /server_linux_amd64

CMD ["sh", "-c", "/start.sh"]
