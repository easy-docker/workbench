FROM ubuntu

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN \
    apt-get update && \
    apt-get install --no-install-recommends -y vim git curl ca-certificates ssh screen htop && \
    apt-get clean && \
    mkdir -p /data && chmod 777 /data

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /root

RUN apt-get install -y command-not-found bash-completion && \
    apt-get clean

VOLUME ["/data"]

CMD ["/start.sh"]