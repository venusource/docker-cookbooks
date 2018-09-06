FROM jenkins/jenkins:lts
MAINTAINER <xg.song@venusource.com>

# Install docker-ce as root
USER root
RUN sed -i 's/\(security\|deb\).debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list
RUN apt-get update -y && apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get -y update && \
    apt-get -y install docker-ce && \
    apt-get clean

# Enable user jenkins to run docker command
# Note: The built image is environment dependent for the permission issue
# of the mapped volume /var/run/docker.sock
# You should use --build-arg to provide the desired group id of docker group
ARG DOCKER_GROUP_ID=1002
RUN usermod -aG docker jenkins && groupmod -g ${DOCKER_GROUP_ID} docker

# Switch back to jenkins
USER jenkins
RUN groups && grep 'docker' /etc/group
