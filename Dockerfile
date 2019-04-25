FROM ubuntu

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN \
    apt-get update && \
    apt-get install --no-install-recommends -y vim git curl zsh wget ca-certificates ssh screen htop python3-pip && \
    apt-get clean && \
    pip3 install pipenv && \
    mkdir -p /data && chmod 777 /data && ln -s /data /root/data

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /root

RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get --purge autoremove && \
    apt-get clean && \
    echo 'export LC_ALL=C.UTF-8;export LANG=C.UTF-8;' >> /root/.bashrc

VOLUME ["/data"]

CMD ["/start.sh"]