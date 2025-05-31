#!/bin/bash

echo "Removendo os logs do Docker"

# Remove all .log files in the Docker directory
sudo find /var/lib/docker/ -type f -name "*.log" -delete

# Truncate all JSON logs to zero size
sudo sh -c "truncate -s 0 /var/lib/docker/containers/**/*-json.log"

echo "Logs removidos com sucesso!"
