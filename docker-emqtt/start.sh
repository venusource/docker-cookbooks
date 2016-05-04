#! /bin/bash
host=${mysql_h:-localhost}
sed -i 's/127.0.0.1/'"$host"'/g' /opt/emqttd/plugins/emqttd_plugin_mysql/etc/plugin.config

username=${mysql_u:-root}
sed -i 's/mysql_username/'"$username"'/g' /opt/emqttd/plugins/emqttd_plugin_mysql/etc/plugin.config

password=${mysql_p:-root}
sed -i 's/mysql_password/'"$password"'/g' /opt/emqttd/plugins/emqttd_plugin_mysql/etc/plugin.config

database=${mysql_db:-venus}
sed -i 's/dbname/'"$database"'/g' /opt/emqttd/plugins/emqttd_plugin_mysql/etc/plugin.config

/opt/emqttd/bin/emqttd start && sleep 10 && tail -f --retry /opt/emqttd/log/*
