FROM verdel/centos-base:latest
LABEL maintainer="Vadim Aleksandrov <valeksandrov@me.com>"

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
RUN dnf install -y http://repo.zabbix.com/zabbix/5.4/rhel/8/x86_64/zabbix-release-5.4-1.el8.noarch.rpm && \
    dnf install -y httpd zabbix-web-mysql && \
    sed -i "s/;\sphp_value\[date.timezone\]\s=.*/php_value\[date.timezone\] = \"Europe\/Moscow\"/" /etc/php-fpm.d/zabbix.conf && \
    sed -i "s/;clear_env\s=.*/clear_env = no/" /etc/php-fpm.d/www.conf && \
    # Clean up
    dnf clean all && \
    rm -rf \
    /usr/share/man \
    /tmp/* \
    /var/cache/dnf \
    /etc/httpd/conf.d/welcome.conf && \
    chown apache:apache /etc/zabbix/web/zabbix.conf.php

# Export ports
EXPOSE 80/tcp
