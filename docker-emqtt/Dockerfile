FROM centos:latest

MAINTAINER zhangxiling <xl.zhang@venusource.com>

ENV DEBIAN_FRONTEND noninteractive

RUN yum update -y && yum upgrade -y

RUN yum install -y wget unzip ntp net-tools

RUN mkdir -p /opt

WORKDIR /opt/

RUN wget http://emqtt.io/static/brokers/emqttd-centos64-1.0.1-beta-20160416.zip

RUN unzip emqttd-centos64-1.0.1-beta-20160416.zip

COPY emqttd.config emqttd/etc/
COPY plugin.config emqttd/plugins/emqttd_plugin_mysql/etc/
COPY start.sh /

EXPOSE 8083 18083

CMD ["/start.sh"]
