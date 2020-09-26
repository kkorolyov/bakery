#!/usr/bin/sh

# bleeding edge always
dnf upgrade -y

# QOLs
dnf install -y vim

# OCI stuff
dnf install -y podman buildah slirp4netns fuse-overlayfs

# pieline environment
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
dnf install -y python-pip java-latest-openjdk yarn

dnf autoremove -y
