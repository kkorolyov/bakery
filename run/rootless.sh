#!/usr/bin/sh

# Prep rootless environment
sysctl user.max_user_namespaces=15000
usermod --add-subuids 100000-101000 --add-subgids 100000-101000 vagrant

# Allow buildah unshare to make use of cache
chmod -R a+rw /var/cache/dnf
