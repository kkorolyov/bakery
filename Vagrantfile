# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :

memory = 4096
cpus = 4

dir_pieline = "/c/dev/projects/pieline"
dir_kubefig = "~/.kube/configs"

http_port = 80
https_port = 443
kubectl_port = 6443

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/33-cloud-base"

  config.ssh.insert_key = false

  config.vm.provision "shell", path: "run/pre.sh", reboot: true
  [
    "dnf.sh",
    "install.sh",
    "podman.sh"
  ].each do |file|
    config.vm.provision "shell", path: "run/#{file}"
  end
  config.vm.provision "shell", path: "run/env.sh", env: {
    "GITHUB_ACTOR" => ENV["GITHUB_ACTOR"],
    "GITHUB_TOKEN" => ENV["GITHUB_TOKEN"]
  }
  config.vm.provision "shell", inline: "curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE='644' sh -s -", privileged: false
  config.vm.provision "shell", path: "run/k3s.sh"

  config.vm.synced_folder dir_pieline, "/pie"
  config.vm.synced_folder dir_kubefig, "/kubefig"

  config.vm.hostname = "bakery.local"
  config.vm.network "forwarded_port", guest: http_port, host: http_port # k3s ingress http
  config.vm.network "forwarded_port", guest: https_port, host: https_port # k3s ingress https
  config.vm.network "forwarded_port", guest: kubectl_port, host: kubectl_port # kubectl

  config.vm.provider "virtualbox" do |vb|
    vb.memory = memory
    vb.cpus = cpus
  end
end
