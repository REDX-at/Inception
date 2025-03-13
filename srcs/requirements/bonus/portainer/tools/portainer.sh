#!/bin/bash

hashpass=$(htpasswd -nb -B admin $PORTAINER_PASS | cut -d ":" -f 2 | tr -d '\n')
/opt/portainer/portainer -H unix:///var/run/docker.sock --admin-password="$hashpass"