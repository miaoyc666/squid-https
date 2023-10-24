FROM debian:11
MAINTAINER miaoyongchao "miaoyc1989@hotmail.com"

WORKDIR /home/s/apps/squid
COPY . .
RUN set -x \
    && echo "Asia/Shanghai" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && cp -f conf/sources.list /etc/apt/ \
    && apt update \
    && apt install -y libltdl-dev \
    && apt install -y unzip \
    && apt clean \
    && unzip squid.zip -d /usr/local/ \
    && rm squid.zip \
    && mkdir -p /var/log/squid \
    && chmod 777 /var/log/squid

CMD ["/home/s/apps/squid/bin/squid", "-f", "/home/s/apps/squid/conf/squid.conf", "-NYC"]