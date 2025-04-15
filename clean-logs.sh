#!/bin/bash

echo "Removendo os logs do Docker"

sudo -i /var/lib/docker/ -type f -name "*.log" -delete

sudo sh -c "truncate -s 0 /var/lib/docker/containers/**/*-json.log"
