#!/bin/bash
#caso queira rodar nginx sem docker
# aguarda a instancia iniciar
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done
# install nginx
apt-get update
apt-get -y install nginx
# inicia o nginx
service nginx start