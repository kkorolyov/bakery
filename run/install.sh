#!/usr/bin/sh

# bleeding edge always
dnf config-manager --set-enable updates-testing
dnf upgrade -y

# QOLs
dnf install -y vim make

# OCI stuff
dnf install -y podman buildah slirp4netns fuse-overlayfs

# k3s
dnf install -y https://rpm.rancher.io/k3s/stable/common/centos/7/noarch/k3s-selinux-0.2-1.el7_8.noarch.rpm
curl -sfL https://get.k3s.io | sh -

# pieline environment
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
curl -sL https://rpm.nodesource.com/setup_14.x | bash -
dnf install -y python-pip java-latest-openjdk yarn

dnf autoremove -y
