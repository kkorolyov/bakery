#!/usr/bin/sh

# Use proper nameservers
rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

# TODO Remove once k3s supports cgroups v2
grubby --args='systemd.unified_cgroup_hierarchy=0' --update-kernel=ALL
