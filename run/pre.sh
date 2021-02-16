#!/usr/bin/sh

# TODO Remove once k3s supports cgroups v2
grubby --args='systemd.unified_cgroup_hierarchy=0' --update-kernel=ALL
