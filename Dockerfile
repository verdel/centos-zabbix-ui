FROM verdel/centos-base:latest
MAINTAINER Vadim Aleksandrov <valeksandrov@me.com>

ENV DB_HOST localhost
ENV DB_PORT 3306
ENV DB_USER zabbix
ENV DB_PASS zabbix
ENV ZABBIX_SERVER localhost
ENV ZABBIX_PORT 10051
ENV HTTP_FQDN localhost

# Copy init scripts
COPY rootfs /

# Install zabbix
RUN yum install -y https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-release-4.2-1.el7.noarch.rpm && \
    yum install -y zabbix-web-mysql && \
    # Clean up
    yum clean all && \
    rm -rf \
    /usr/share/man \
    /tmp/* \
    /var/cache/yum \
    /etc/httpd/conf.d/welcome.conf && \
    chown apache:apache /etc/zabbix/web/zabbix.conf.php

# Export ports
EXPOSE 80/tcp
