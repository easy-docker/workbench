FROM ubuntu

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apt-get update \
    && apt dist-upgrade -y \
    && apt-get install -y vim git curl ca-certificates ssh screen \
    && apt-get clean

ADD start.sh /start.sh

RUN chmod +x /start.sh \
    && apt-get install -y command-not-found bash-completion iproute2 net-tools dnsutils inetutils-ping \
    && apt-get clean

WORKDIR /root

CMD ["/start.sh"]
