#!/usr/bin/sh

# create host path for volumes
mkdir -m777 /var/vol
chcon -Rt svirt_sandbox_file_t /var/vol
