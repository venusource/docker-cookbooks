FROM centos:latest
MAINTAINER gf.li@venusource.com
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
COPY CentOS7-Base-163.repo /etc/yum.repos.d/
RUN yum update -y
RUN yum install -y java-1.8.0-openjdk
RUN yum clean all
