#!/usr/bin/sh

# bleeding edge always
dnf upgrade -y

# QOLs
dnf install -y vim

# OCI stuff
dnf install -y podman buildah slirp4netns fuse-overlayfs

# pieline environment
dnf install -y python java-latest-openjdk

dnf autoremove -y
