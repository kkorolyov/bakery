#!/usr/bin/sh

# local registry mirror
tee -a /etc/rancher/k3s/registries.yaml <<EOF
mirrors:
	dreg.local:
		endpoint:
			- http://dreg.local
EOF
