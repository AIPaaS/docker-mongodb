FROM centos:7

COPY bin/ /bin/
COPY mongod.conf /mongod.conf
COPY start.sh /start.sh
RUN chmod 755 /mongod.conf /start.sh

VOLUME ["/data/db"]

WORKDIR /

EXPOSE 27017

CMD ["/start.sh"]
