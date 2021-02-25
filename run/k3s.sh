#!/usr/bin/sh

# local registry mirror
tee -a /etc/rancher/k3s/registries.yaml <<EOF
mirrors:
	dreg.local:
		endpoint:
			- http://dreg.local
EOF
echo "127.0.0.1	dreg.local" | tee -a /etc/hosts

# export generated kubeconfig
cp /etc/rancher/k3s/k3s.yaml /kubefig/bakery.yaml
