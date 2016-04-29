#! /usr/bin/env bash
set -eu

COMMAND="/opt/emqttd/bin/emqttd start"

PONG="pong"

function check_process {
  OUTPUT="$(/opt/emqttd/bin/emqttd ping)"
  RESP="${OUTPUT}"
  if [ "$RESP" != "$PONG" ];
  then exit 1000;
  fi
}

$COMMAND

while : 
do
  check_process
  sleep 0.5
done
