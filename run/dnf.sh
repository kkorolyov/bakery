#!/usr/bin/sh

tee -a /etc/dnf/dnf.conf <<EOF
fastestmirror=True
max_parallel_downloads=10
keepcache=True
EOF
