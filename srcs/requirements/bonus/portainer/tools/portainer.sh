#!/bin/bash

hashpass=$(htpasswd -nb -B admin pass | cut -d ":" -f 2 | tr -d '\n')
/opt/portainer/portainer -H unix:///var/run/docker.sock --admin-password="$hashpass"