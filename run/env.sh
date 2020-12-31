#!/usr/bin/sh

# GitHub Packages config from Vagrant env
tee -a /etc/profile.d/env.sh <<EOF
export GITHUB_ACTOR=$GITHUB_ACTOR
export GITHUB_TOKEN=$GITHUB_TOKEN
EOF

# image registry
echo "127.0.0.1	dreg.local" >> /etc/hosts
