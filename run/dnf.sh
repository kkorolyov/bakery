#!/usr/bin/sh

tee -a /etc/dnf/dnf.conf <<EOF
fastestmirror=true
max_parallel_downloads=10
keepcache=true
EOF
