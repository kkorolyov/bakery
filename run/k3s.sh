#!/usr/bin/sh

# server config
tee -a /etc/rancher/k3s/config.yaml <<EOF
write-kubeconfig-mode: "0644"
node-name: k3s.server
kube-apiserver-arg: 
	- --service-node-port-range=5000-32767
EOF

# local registry mirror
tee -a /etc/rancher/k3s/registries.yaml <<EOF
mirrors:
	docker.io:
		endpoint:
			- http://localhost:5000
EOF

# export generated kubeconfig
cp /etc/rancher/k3s/k3s.yaml /vagrant
