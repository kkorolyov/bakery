#!/usr/bin/sh

# local registry mirror
tee -a /etc/rancher/k3s/registries.yaml <<EOF
mirrors:
  dreg.local:
    endpoint:
      - http://dreg.local
EOF
echo "127.0.0.1	dreg.local" | tee -a /etc/hosts
