# docker-cookbooks
Dockerfiles for useful docker images

## jenkins

Jenkins/Dockerfile主要是解决运行在Docker中的Agent执行Docker命令的问题。

基于jenkins/jenkins:lts基础镜像，系统是debian，安装最新的docker-ce引擎，但是只会使用客户端。

构建镜像时需要使用`--build-arg`传入`DOCKER_GROUP_ID=<id>`参数，这个参数是所构建镜像运行宿主机的docker组的gid，这个参数会保证镜像中的docker组和宿主的docker组有相同的gid，遗憾的是宿主的docker组gid也可以不同，因此构建出的镜像是依赖宿主机环境的。如果没有指定参数，默认值是`1002`。

例如，运行镜像的宿主机docker组gid是993，那么可以使用如下命令构建并打venusource/jenkins:lts tag：

```
docker build -t venusource/jenkins:lts --build-arg DOCKER_GROUP_ID=993 jenkins/
```

运行该镜像时，除了jenkins/jenkins:lts基础镜像的必须参数以外，还需要影射宿主机的docker引擎接口/var/run/docker.sock到镜像的相同路径。典型的启动jenkins容器的命令如下：

```
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock venusource/jenkins:lts
```
