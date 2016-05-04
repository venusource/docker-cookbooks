MQTT消息服务器

MQTT端口：1883

Dashboard：18083

启动docker容器

mysql_h ：mysql服务的IP

mysql_u ：mysql服务的用户名

mysql_p ：mysql服务的密码

mysql_db ：所要连接的数据库名称

docker run -e mysql_h="192.168.0.122" -e mysql_u="root" -e mysql_p="root" -e mysql_db="venusource" -d emqtt
