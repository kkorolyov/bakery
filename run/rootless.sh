#!/usr/bin/sh

# Prep rootless environment
sysctl user.max_user_namespaces=15000
usermod --add-subuids 100000-101000 --add-subgids 100000-101000 vagrant

tee -a /etc/containers/containers.conf <<EOF
runtime = "crun"
EOF

mkdir -p /etc/systemd/system/user@.service.d/
tee -a /etc/systemd/system/user@.service.d/delegate.conf <<EOF
[Service]
Delegate=memory pids cpu io
EOF

# Allow buildah unshare to make use of cache
chmod -R a+rw /var/cache/dnf
